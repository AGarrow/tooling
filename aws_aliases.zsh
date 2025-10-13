aws-refresh() {
    local profile_name="${1:-Production:bp-Engineering}"
    aws-sso login && \
    perl -i -ne "print unless /^\[default\]/ .. /^aws_session_token/" ~/.aws/credentials && \
    {
        aws-sso credentials --profile "$profile_name" | \
        tail -n +2 | \
        sed "\$d" | \
        sed "s/\[.*\]/[default]/"
        cat ~/.aws/credentials
    } > /tmp/creds && \
    mv /tmp/creds ~/.aws/credentials
}