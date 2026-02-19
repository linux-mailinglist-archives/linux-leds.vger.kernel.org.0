Return-Path: <linux-leds+bounces-6970-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOrQLEAgl2nwuwIAu9opvQ
	(envelope-from <linux-leds+bounces-6970-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 19 Feb 2026 15:37:52 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB6315F9F3
	for <lists+linux-leds@lfdr.de>; Thu, 19 Feb 2026 15:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F45B304F319
	for <lists+linux-leds@lfdr.de>; Thu, 19 Feb 2026 14:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F06033F8D6;
	Thu, 19 Feb 2026 14:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qwtd0xGt"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0B51F30A4;
	Thu, 19 Feb 2026 14:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771511680; cv=none; b=oJgU19EuBi7BgsEt+MgOdIdPs/+gQM+HEqfatnMRvMmCHWUUMAom+K/Iakax4ffUUvn/IV7lF2ahLcGEn24yznENa18oBjOHLq5pjBsSuGwNdunBXyW0MFY62ZqQ4pgfQtY4Cm/tkNy4pTv9UGX0vo4m1VyUs5znaQ8hFWGsF4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771511680; c=relaxed/simple;
	bh=RG5Hfgymi3riW3PE9yJni3eUxCYk3oiRt1b+niVy5Yc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bxZ8iPuBL8R745GwsvqvM2/sa8/Mk11gx2ZioH0FD0oRgV7dvd/rTgO5taaWZpCWJLZp1jTwoxiagtyE8MjaLzznc+yYYsPpXGrDjD6Et1KIilS8ieGMo1C6Go8JrzNtfRvKLLgXlbbszITX4gALWjXclAS4zGaD0DjrG5n2ZuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Qwtd0xGt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8B5C116C6;
	Thu, 19 Feb 2026 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771511679;
	bh=RG5Hfgymi3riW3PE9yJni3eUxCYk3oiRt1b+niVy5Yc=;
	h=From:To:Cc:Subject:Date:From;
	b=Qwtd0xGtGRoDIHLCOW3oHZ7TDMAbiHIiShD5BOmZFF3c4WBv2k9tfRvXhohlONMpx
	 glRjeuq/+wUp1F9WSX+qPoasNlhlli9c0zCoNcqU5BIShdvHKO9L9ofBOsvGf5T3G/
	 o+eFFN5lzyF1rqYqzQSb0F3l/SX3V5VpAtdzudQE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	stable <stable@kernel.org>
Subject: [PATCH] leds: qcom-lpg: Check for array overflow when selecting the high resolution
Date: Thu, 19 Feb 2026 15:34:35 +0100
Message-ID: <2026021934-nearby-playroom-036b@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 40
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=RG5Hfgymi3riW3PE9yJni3eUxCYk3oiRt1b+niVy5Yc=; b=owGbwMvMwCRo6H6F97bub03G02pJDJnT5atctL9p3XlrsUft3PI3Xmz9jZqbYvr/HZt46/PMf fYVIq43OmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAivrMZ5vAkvXisZac5cXJC 7NzMWDXTO868JgzzXcSztty5vv/oq3f5cnHWIi+4r5ukAwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6970-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 1FB6315F9F3
X-Rspamd-Action: no action

When selecting the high resolution values from the array, FIELD_GET() is
used to pull from a 3 bit register, yet the array being indexed has only
5 values in it.  Odds are the hardware is sane, but just to be safe,
properly check before just overflowing and reading random data and then
setting up chip values based on that.

Cc: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org
Assisted-by: gkh_clanker_2000
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
This issue was found by running a tool to compare a past kernel CVE to
try to find any potential places in the existing codebase that was
missed with the original fix.

 drivers/leds/rgb/leds-qcom-lpg.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index f54851dfb42f..1da384b07dc0 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1273,7 +1273,12 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		return ret;
 
 	if (chan->subtype == LPG_SUBTYPE_HI_RES_PWM) {
-		refclk = lpg_clk_rates_hi_res[FIELD_GET(PWM_CLK_SELECT_HI_RES_MASK, val)];
+		unsigned int clk_idx = FIELD_GET(PWM_CLK_SELECT_HI_RES_MASK, val);
+
+		if (clk_idx >= ARRAY_SIZE(lpg_clk_rates_hi_res))
+			return -EINVAL;
+
+		refclk = lpg_clk_rates_hi_res[clk_idx];
 		resolution = lpg_pwm_resolution_hi_res[FIELD_GET(PWM_SIZE_HI_RES_MASK, val)];
 	} else {
 		refclk = lpg_clk_rates[FIELD_GET(PWM_CLK_SELECT_MASK, val)];
-- 
2.53.0


