Return-Path: <linux-leds+bounces-7421-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAZoEcudwGnrJAQAu9opvQ
	(envelope-from <linux-leds+bounces-7421-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 02:56:27 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B31262EBB13
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 02:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0AF2A300B854
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 01:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34C923815B;
	Mon, 23 Mar 2026 01:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGsqHg9u"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1497B2248AF
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 01:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230904; cv=none; b=TTYysu8njMAG2yqUEDGXNEY3gz1azi5j7skG/gRsL0af11zY1TnxlxZW/umrnO7lWU8EFbKBdwjZ0bOVmWx/Mh61+EUl1Eal/lcT/yg56rt3M5o11IvqK6g9vZEs/qdogU8zhwu4FSyA+kC3PxKs6k5tshWDrELTM0Fp818QYXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230904; c=relaxed/simple;
	bh=oa2EwaUUG59FtphzeTYHy1LbWnpif4xM00zY4CiwrfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PB21dRzNOp4sz6YmBNuqVQT8l3J/PXrOWvqDqfSC0txluFMFJM8+6z1yw6SBp+nHOjDRV8rX4vPUwmRVzuluoJip96HL9ieau7HX1eXAbcYfp5l5Y8jNiz95Hj09XRc5rEkK/0dhf/wL+BxYMGhMMebaQzXfMBBCC93YMn24Oio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGsqHg9u; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c107ef474fso4398630eec.0
        for <linux-leds@vger.kernel.org>; Sun, 22 Mar 2026 18:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230900; x=1774835700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBYbOsFewxAK/zyXErJyI2wWdOZnO5pIFOiKOKYi888=;
        b=DGsqHg9u8PZBheqZmCbwCygye4QFZ5ls7ZTjLNcDdLc8lNWsLUAb7+azOoGrE2fxsZ
         pirnDYbzR3NgIV3X8c7NDwwT3bxsIalIYolIyIkEEVthhG4uEbhiwSJsF4LQoRqBsjWt
         NcPXkgrxG6p8YnvyQOQHlZiJfDqBZvFiNhUbSzVyanppF9lwjCwF37UDljU+sho4aXdc
         kA1QVEc5rNVpmEbfjh4WITCnjpp8qF0r2pOO47PSRdqVjeKbivsv7cOYAzTNJuix2XbZ
         MZmVcH/ZGGbzlAfOMtW1PWao0skp1Z40jqbSpnhHqzzjDYHyjwK+yDjQujbW4A4oNgSV
         dq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230900; x=1774835700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uBYbOsFewxAK/zyXErJyI2wWdOZnO5pIFOiKOKYi888=;
        b=Vz580BdLn8PmEUId1Ixamb4DKvvoCtCBQ86fzKRpg68Nuj1hMh3lcwyxGUDBghw82y
         0w25Q6AJxDYhehoW9rYQwZZ94jKR7TXk0zPSGTW9fJg/oFnadGjywyYcDEhuAcCg5cke
         H6ATMdsJxNwNV2vCUHy2ZW313kXQteJi3VR1jjMwjUM+lb0euCX6y0Vf16DMBKvEZRYi
         yJT/zsLKLVoqDiqLVuLHZOtpDO9wVXtpeXiKyvMdcrIa0eWP27nsn9Ub7N1at+2UklUQ
         kOsPAJq7ZLT5cV/mb5tZT3NA32EQO9EYKdI5VLPdnM+X/+MuusbG2ZT6KxeI70mGWHS6
         JKZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDxzhZdNg4IIauH0q7p4DfpgQNa5yCK5Z1KK8ogod7RxQHXOO7c/W07ryeDG5c2oSultYj7kPaQEn3@vger.kernel.org
X-Gm-Message-State: AOJu0YxzreMBz9wjEzHB04/LqPp2Wi/oEjUFXzAr9t0sUFOmdEZ3HKta
	gzaNYwLQyQ13cfaL9khqQgw2KdPRoWJO0LSAauCT7v0wXIScyp3D6hAy
X-Gm-Gg: ATEYQzy2MdXwg6/N27DTcVbXBdJt/bE0sSDjf1CR670vkHzkEaeeUwOPthXhwb3aAtf
	eZmmjNi0nQx3/erEnNiP5lT8wDkuIeCqcFRo51E+n4As+e2/lxIHGEB9YV6qH2Ahz6Bb01XPAme
	fvWYYqw/XQV4v0A0tYKTr1feBjp3WqPO79Tc/PlBZkImt62aQ7AHzLRgqF1rn37CFZgU9shSLZO
	u/nlWYWOWwX1xBE2vbbDN3Y7egOo8IdKtTgvkRxL++6/X1P3ZEt8uIb68K6AcSjjTrPUciQBnYF
	qkPHLc1OvlHu2HynEQCIu3Ey/Ye2BSxphmckNUigaYP+GZNIHWxUTNxqoE9UFAqYo1HHyGB1rWX
	XCRq7A+LxXIB3GHvDwJveoOHWmxm+Db5UJkJexgKy84zCC7I5nYBKC/MXXZ+tdU2kFVQAuX0oXt
	JxgyNYZjlQ7/xKcqyRq8egpiKC4Ox+gu7ByF1gaLzlA4PrO/WCJRb7+yhEz1FRxq0QHl0PY+pbG
	sf1N8d+GQJnUok=
X-Received: by 2002:a05:693c:2b06:b0:2bd:c8a2:954 with SMTP id 5a478bee46e88-2c1097b8ae8mr5509864eec.24.1774230900153;
        Sun, 22 Mar 2026 18:55:00 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:59 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH 09/10] fpga: manager: switch to using class_find_device_by_fwnode()
Date: Sun, 22 Mar 2026 18:54:27 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-9-b72eb22a1215@gmail.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a6826
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7421-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B31262EBB13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In preparation to class_find_device_by_of_node() going away switch to
using class_find_device_by_fwnode().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/fpga/fpga-mgr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/fpga/fpga-mgr.c b/drivers/fpga/fpga-mgr.c
index 2672070ced02..1e7585a4608a 100644
--- a/drivers/fpga/fpga-mgr.c
+++ b/drivers/fpga/fpga-mgr.c
@@ -716,7 +716,8 @@ struct fpga_manager *of_fpga_mgr_get(struct device_node *node)
 	struct fpga_manager *mgr;
 	struct device *mgr_dev;
 
-	mgr_dev = class_find_device_by_of_node(&fpga_mgr_class, node);
+	mgr_dev = class_find_device_by_fwnode(&fpga_mgr_class,
+					      of_fwnode_handle(node));
 	if (!mgr_dev)
 		return ERR_PTR(-ENODEV);
 

-- 
2.53.0.959.g497ff81fa9-goog


