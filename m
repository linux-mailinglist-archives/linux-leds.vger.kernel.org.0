Return-Path: <linux-leds+bounces-4376-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E3CA74CE3
	for <lists+linux-leds@lfdr.de>; Fri, 28 Mar 2025 15:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC3CB173D62
	for <lists+linux-leds@lfdr.de>; Fri, 28 Mar 2025 14:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8C424B34;
	Fri, 28 Mar 2025 14:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQL65rkv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25080DDC5;
	Fri, 28 Mar 2025 14:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172406; cv=none; b=N87snSCe8194S9Ozv4FObyITezNuOMGMf9hcq6sb2MX8iCv/5qbRfARCVdyIxxVGSfPAK4dfGZ2VSvkjqe7KkNyh/qHXQKR5+20CKf43RF3XK6pkRr/XJj/hJPoEf2OHbvI71HGbvnPFKlMoooXRXX98rN2TwyBQmdGrY4MuYy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172406; c=relaxed/simple;
	bh=exiAf3JTR79CnexHmDH248L4l9xNspbe/I1gW2NbaE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HUvvvCfqCcRlU+qm5HgGwNNnyEdoPl9NyhF1vykC4X3TzhDBGOiDhukaGIs781xXHvHAfzOWPKBeutj/2VxyWpr8yIZNA1r91PhaHywAB1eOLASJBN8S5M3IxBNI6w+hXVPud6/JB4pKh43cXU69xCsx8g6ZKlfCkQQf01ARrnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQL65rkv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE05C4CEE5;
	Fri, 28 Mar 2025 14:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743172405;
	bh=exiAf3JTR79CnexHmDH248L4l9xNspbe/I1gW2NbaE4=;
	h=Date:From:To:Cc:Subject:From;
	b=ZQL65rkvLNsYajUVehOZdQvoqim9PhQFwVSbc+IjFidxLmlBGf1/d31zFcEMgxJ7o
	 aajh69zIdetdVvULoWVr0kyHctvuaZJO0DE9P2ejYunk1ZnqqfFuLmelBKsbdiwReF
	 X5NOXtxWWdTjCLJ5uLF6giW/EHDxrpLoQmbzsUpF1llG/rmG8AZ6abK9oMplaQv4WO
	 McCEVKJwnNz3wOn1iqk3L8QF9AgS4qCWhX5hSLNgvRETmQMfzjNz8gOSbe/ttR2s7x
	 kFlQO7850P0Sn5wRUUf9Q3FIk1pINtNntM9ZHa6pSnbCcTX8EafV8wzA2r5stPq8ta
	 X6sI9vy9ViQSQ==
Date: Fri, 28 Mar 2025 08:33:22 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] leds: Avoid -Wflex-array-member-not-at-end warning
Message-ID: <Z-azMlPnP7nPPJrY@kspp>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
a flexible structure where the size of the flexible-array member
is known at compile-time, and refactor the rest of the code,
accordingly.

So, with these changes, fix the following warning:

drivers/leds/leds-cros_ec.c:70:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/leds/leds-cros_ec.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
index 275522b81ea5..6eab0474f52d 100644
--- a/drivers/leds/leds-cros_ec.c
+++ b/drivers/leds/leds-cros_ec.c
@@ -66,24 +66,20 @@ static int cros_ec_led_send_cmd(struct cros_ec_device *cros_ec,
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
+	DEFINE_RAW_FLEX(struct cros_ec_command, msg, data,
+			sizeof(union cros_ec_led_cmd_data));
+
+	msg->version = 1;
+	msg->command = EC_CMD_LED_CONTROL;
+	msg->insize  = sizeof(arg->resp);
+	msg->outsize = sizeof(arg->req);
+	*(struct ec_params_led_control *)msg->data = arg->req;
+
+	ret = cros_ec_cmd_xfer_status(cros_ec, msg);
 	if (ret < 0)
 		return ret;
 
-	arg->resp = buf.data.resp;
+	arg->resp = *(struct ec_response_led_control *)msg->data;
 
 	return 0;
 }
-- 
2.43.0


