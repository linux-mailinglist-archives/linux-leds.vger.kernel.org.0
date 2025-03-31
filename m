Return-Path: <linux-leds+bounces-4384-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31457A76C5B
	for <lists+linux-leds@lfdr.de>; Mon, 31 Mar 2025 19:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5850018860B5
	for <lists+linux-leds@lfdr.de>; Mon, 31 Mar 2025 17:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2F3156653;
	Mon, 31 Mar 2025 17:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XQWvG82g"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336017DA9C;
	Mon, 31 Mar 2025 17:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743440502; cv=none; b=P5kbAZIoUFEevCQguUHTYBpMU7GD9mCtxNQTm/swbs3NZ/XjMVmi7b+nLDkZEAEUidyt+BGKfh3Gkrq462LfzDO7oetqpUmSuX4rT2q27a7HB/p6AAgCRKmY/5eY9x8Ut4d9UL6sodDKGyhhzHNWpPwld75JaSohDW2lJ218aBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743440502; c=relaxed/simple;
	bh=6gNrD6rhX5iuo1PEzyMHSc39hXph6HLJfwyv/eyZCtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OGUPIaSlHGw6IZP1jGnXL7nNboIokJCqk2pYczdaGM4maRyW07BfP1p70ByM0dku8fcVus2NSMWO/ICpXTMB2Mc/G8MBVRfrUscstAifBuwn5j6ZVOBo27+mQtUfzSkZZwhEjljWXXHUVkkF35oI3M7JlQJHZUy7r/nzr2Jkfcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XQWvG82g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2995C4CEE3;
	Mon, 31 Mar 2025 17:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743440501;
	bh=6gNrD6rhX5iuo1PEzyMHSc39hXph6HLJfwyv/eyZCtM=;
	h=Date:From:To:Cc:Subject:From;
	b=XQWvG82gyqHveXCVuH/qp2bsBYpPZbqxqzhleTR5q3PyfIM+GY9MpyRzYUALW8E6l
	 fxXd4Qfa2jK7bl0lvkzHxVlJSXW1sssfxcbHMqMTCtdcPwnlk5Aour7v2E2MZzUdRv
	 Hr6+NXGJCwVVWtvihVrqOtbvFnd1qmOgx4MYrirVMNUhqK6HMoAr48wBvWqSheGaI+
	 CQwnWK3OgBzA5QcsGtC/zXl0k6x2VRwaNYF/9Sv2xDyiiTSXiZbmw4gPZQvPkgu3SR
	 U3TbrS8n6CUmKEwE0kyygJC3/a00sq2KbHuMS/JL4+WVgx79V89i3HaJ1CkLgHY30G
	 DxwVX8sCNEeXA==
Date: Mon, 31 Mar 2025 11:01:38 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2][next] leds: Avoid -Wflex-array-member-not-at-end warning
Message-ID: <Z-rKcgFjsyKvd58q@kspp>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Replace an on-stack definition of a flexible structure with a call
to utility function cros_ec_cmd().

So, with these changes, fix the following warning:

drivers/leds/leds-cros_ec.c:70:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
Changes in v2:
 - Use utility function cros_ec_cmd() instead of DEFINE_RAW_FLEX(). (Thomas Weißschuh)

v1:
 - Link: https://lore.kernel.org/linux-hardening/Z-azMlPnP7nPPJrY@kspp/

 drivers/leds/leds-cros_ec.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
index 275522b81ea5..377cf04e202a 100644
--- a/drivers/leds/leds-cros_ec.c
+++ b/drivers/leds/leds-cros_ec.c
@@ -60,31 +60,18 @@ static inline struct cros_ec_led_priv *cros_ec_led_cdev_to_priv(struct led_class
 union cros_ec_led_cmd_data {
 	struct ec_params_led_control req;
 	struct ec_response_led_control resp;
-} __packed;
+};
 
 static int cros_ec_led_send_cmd(struct cros_ec_device *cros_ec,
 				union cros_ec_led_cmd_data *arg)
 {
 	int ret;
-	struct {
-		struct cros_ec_command msg;
-		union cros_ec_led_cmd_data data;
-	} __packed buf = {
-		.msg = {
-			.version = 1,
-			.command = EC_CMD_LED_CONTROL,
-			.insize  = sizeof(arg->resp),
-			.outsize = sizeof(arg->req),
-		},
-		.data.req = arg->req
-	};
-
-	ret = cros_ec_cmd_xfer_status(cros_ec, &buf.msg);
+
+	ret = cros_ec_cmd(cros_ec, 1, EC_CMD_LED_CONTROL, &arg->req,
+			  sizeof(arg->req), &arg->resp, sizeof(arg->resp));
 	if (ret < 0)
 		return ret;
 
-	arg->resp = buf.data.resp;
-
 	return 0;
 }
 
-- 
2.43.0


