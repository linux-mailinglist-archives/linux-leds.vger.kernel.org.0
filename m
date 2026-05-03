Return-Path: <linux-leds+bounces-7949-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHvUBE759mkyawIAu9opvQ
	(envelope-from <linux-leds+bounces-7949-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 09:29:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBD54B4B73
	for <lists+linux-leds@lfdr.de>; Sun, 03 May 2026 09:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8205302EEF2
	for <lists+linux-leds@lfdr.de>; Sun,  3 May 2026 07:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6343815F1;
	Sun,  3 May 2026 07:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csb2zVQ1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3673A9610
	for <linux-leds@vger.kernel.org>; Sun,  3 May 2026 07:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777793233; cv=none; b=fboWB72Mja2YKryAyr+bKjkN+RxhPnVtI1dsFgkRMwaOLF38eJganSocmuciVwvfHJ0QoAsKxqYNHpmb79JoeAWkD+CJ0B4QLpnQKtURX36Vpk2Mu3NhYSxum/Mk5THzYdTraESalfRiyH+AHueBxfYy2JvOequ1eHzuHgrrGLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777793233; c=relaxed/simple;
	bh=Mz+1pplQ0JIsxE7949cAUpL6y+IvtSik4EpUdewqA24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=creixAsDPZZwFq2KoS0UFfm5gRtx+avJbCtknc4b4cJgcb5F9GlpdWhGze0Jk4XoMvDHUmBFGZb4Qo3c2lp0Jwlx/goybkND3zYvAit7RtZldJjXesNLH77BrpNQ9xaQsljOXXbaH+nFEYORMRdbZq5Jdy0USCbG6yMw6gm/oOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csb2zVQ1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b788a98557so26766845ad.2
        for <linux-leds@vger.kernel.org>; Sun, 03 May 2026 00:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777793232; x=1778398032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTEfk4Xq7IA6AAhVE3/F26Caaw0jUui+q3LfKcseDq8=;
        b=csb2zVQ1IFT9pQ2effwko2T+Nl9BWkjXsPRwe43B96+jWS6/z/zT2xlLZasrrhu5nQ
         SyYPMaBEuenaxsLlLv6QaHegZ2y9S7QWNOiDChbnSgSsAnxRZ/uJC0YmtVEIjpXQQ+eQ
         3kbizxK584+t7La8mDd2LYMOCZ5FI5Oimzn1UIlN/xQSRXLCXImeIagVHe2c3Jps+aLN
         c9mD1OsLhnA7dVYfWWep62Q13/BM+9531qy5ef8OiuacU4ytg3ha9M9uf58u4s74qfPA
         qYISvWwg7/kI1+4CW0odawvE61wMbko1rTRarBqrULjP1F1aKL9OpoXk7bpqtPSBrDib
         9ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777793232; x=1778398032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vTEfk4Xq7IA6AAhVE3/F26Caaw0jUui+q3LfKcseDq8=;
        b=ZgaxlkpJhuCd83F04JqE/rq+h6+/F2urX20V8Qq3mkLUVhv57fZjwIBAeEW0ThY4xE
         +OcvMyPYKEWuopOp2ztpd1ZOIps1KKwqz+QmtGLyq9B7g/ibm0IZibNHKui4gGTUPB5u
         yaLQQW2k5z0+K2bx+QSBGBQruMaoFYvkaUVpHXZhH1wxEXM3lqv8qhK+gO2N0P1o0gdw
         t8wHIVHcmTbD5RsXCtsOg7OVUISKdp1XAmHLDRxjI+gKyQ+6L5b9V8Ph7d8rjaCj6+SB
         02R+eQs5hCdclr3ZIZyjCfuWY/tu8KUCmNbbAqlmyeOG2r/AWvX3pySi8aAfgoI1YVHK
         i7MA==
X-Forwarded-Encrypted: i=1; AFNElJ8pNCn8VdEtjbCsVP4gE6XsbqPDLqb0gRsMeOxEKCGyLa5G0Kyl5SZZtMHu9AosikMiGzqo1AXoIZUP@vger.kernel.org
X-Gm-Message-State: AOJu0YzHbKC9YPC8dlQmu+TrqAO/0N1QC1ofGdSdQujywlq7jD/ijxMJ
	+Ao3GPAk1R4LPWMv/wlJH3H2biPh866PzHrMNmT2IYN72CHLHPUHbnp9
X-Gm-Gg: AeBDieupvNJAMM4oL9V+95fYgX/3Bujbo9gklWpbphFN5WA2dmcsWl6qWD2O/cpQxBK
	jG/3tKih85bc+SRuQqYjRJQLCF4LkTrwYnjTf+FDMDgHQL7ME6D8M3h9TM3sLuCEMzOYEoTt1kH
	8sIHwlfNzbS7QsU3H18ePcE7MV2hrw3VUgClS6YI23IxSyjslMTAhELcHWrajY01eA2oYyQXcVf
	1VC7gVd4euh2FdtW4HIibVQ6/O77NlzCqktzXRzDIAJ7/wyfAgm6OnL19CxMZRSCZjj/5hU/J0P
	//ducSAXrl8KQcw0UjzzUoBKLn82BrB+uaDKjnStyhAu/Fqo5EokhR/0w0rq7LrsgWX5qJjGiBX
	mVUzbhteblMBvToMiQOoj0CY5gGUdWLrpQIfoptrayPjyZpY6DJloA7137ZqHsxVfAVSfq+llmN
	CBZe88XLu0qtpLP51Oa589OwxRQdMAF4VxZXw2l7mmxi2EIOHPfKL5kDc8Cxu2jxNqipu+Jw==
X-Received: by 2002:a17:903:1ab0:b0:2ba:1202:4fa8 with SMTP id d9443c01a7336-2ba1202518emr12938835ad.20.1777793232110;
        Sun, 03 May 2026 00:27:12 -0700 (PDT)
Received: from tranquility.wa.lan (60-241-74-71.static.tpgi.com.au. [60.241.74.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae16a9esm64942945ad.50.2026.05.03.00.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 00:27:11 -0700 (PDT)
From: James Ye <jye836@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	lee@kernel.org,
	pavel@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	denis.benato@linux.dev,
	James Ye <jye836@gmail.com>
Subject: [PATCH 4/6] HID: multitouch: add support for ASUS T3304 media keys
Date: Sun,  3 May 2026 17:26:41 +1000
Message-ID: <20260503072643.2774762-5-jye836@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260503072643.2774762-1-jye836@gmail.com>
References: <20260503072643.2774762-1-jye836@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7DBD54B4B73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-7949-lists,linux-leds=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jye836@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-leds];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Touchpad functionality already works with hid-multitouch, but media key
events are emitted from the touchpad interface. Add MT_CLS_ASUS to
handle these, and also add missing key mappings.

Signed-off-by: James Ye <jye836@gmail.com>
---
 drivers/hid/hid-multitouch.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index e82a3c4e5b44..a49930496c5b 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1510,6 +1510,10 @@ static int mt_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 		case 0x35: mt_map_key_clear(KEY_DISPLAY_OFF);		break;
 		case 0x6b: mt_map_key_clear(KEY_F21);			break;
 		case 0x6c: mt_map_key_clear(KEY_SLEEP);			break;
+		case 0x7c: mt_map_key_clear(KEY_MICMUTE);		break;
+		case 0x4e: mt_map_key_clear(KEY_FN_ESC);		break;
+
+		case 0x86: mt_map_key_clear(KEY_PROG1);		break; /* MyASUS key */
 		default:
 			return -1;
 		}
@@ -2145,6 +2149,12 @@ static const struct hid_device_id mt_devices[] = {
 			USB_VENDOR_ID_ASUSTEK,
 			USB_DEVICE_ID_ASUSTEK_T304_KEYBOARD) },
 
+	/* Asus T3304 */
+	{ .driver_data = MT_CLS_ASUS,
+		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_ASUSTEK,
+			USB_DEVICE_ID_ASUSTEK_T3304_KEYBOARD) },
+
 	/* Atmel panels */
 	{ .driver_data = MT_CLS_SERIAL,
 		MT_USB_DEVICE(USB_VENDOR_ID_ATMEL,
-- 
2.54.0


