Return-Path: <linux-leds+bounces-7422-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BBIE5mdwGnrJAQAu9opvQ
	(envelope-from <linux-leds+bounces-7422-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 02:55:37 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0A92EBAB3
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 02:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 01EC0300D4FC
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 01:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15321238D27;
	Mon, 23 Mar 2026 01:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQTB8zRw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D889227EB9
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 01:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230904; cv=none; b=FGPaDmeYVQEme2F7QWC9k2bPUQJ+t2/rcj4RkSQyUsWx3CokL6+U4uAQh1Cq5IvrK6m42HeFPSg2bXGxPBQ+S/ctI1uyzXtBed43g46luxV3nfju2zk9CQJD+JzFx7RrOzn6keI3xR1vw59lyWRZNfGDW7984h7WadZoDL9k2zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230904; c=relaxed/simple;
	bh=DcXRlt171JGbuJjlPztdgWcwKxWTeoWbtUiwkXQpQqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gi1zZ5+nVDRFdnfALddM7CGFB1TlRUXmoRzA5lR6w4Le+xHDIz+wepkhTkCIeHraqhA9pXrRidr9MQ64LnGgM7eN4Yo9MZcWEg56i7WeeybWjrXq1PactClIRShEEdhJ+FrUJj3Em0/3vYG57KFoTJKABHOkyWdqCnlkytnvYzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQTB8zRw; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c0ea57fea7so4332861eec.0
        for <linux-leds@vger.kernel.org>; Sun, 22 Mar 2026 18:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230902; x=1774835702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPoVYlhKSTxPQorecgbDpnVbncz+dhf8Hr/jKiyeXpk=;
        b=YQTB8zRwPAB4QpBiAR72NGwqYgz7yRnzGtpKefhsQLbAj13ZIA+Aj0yO+kjlG+okzf
         YXcUNWs38uleasMsCZubgf1NIC0s98u4bXjE5dEaedt2TEvKcsIJ1dgx5AGGQTjlbamB
         qXNyTwRRBGi0ErQttPHZCuVQTZWXrmOS6ui4YQS54qb/vC1I6Sc9I1o9GwO0UkR+QSke
         P/7yfkeoCkWGAMjAotnwhvwzY9x60uTpTaGf0WoFunIzVlzgSu4UP+RG1mkt6XVCmaUR
         9Eln+0KL7RpNFZVk5/gDXv0irmYvq3xW+0pC7hKYovjebsnfeqPP38CpQAGRQb+rBOve
         Fo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230902; x=1774835702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QPoVYlhKSTxPQorecgbDpnVbncz+dhf8Hr/jKiyeXpk=;
        b=sRmUecTSvQrsL38Dq85qQMBPdx1j4RNDxecJAt4chDB55KT7kJzjH5mHkpbUqWbeK+
         gCS6INgYURn8WHoIHRNI0s7G5KXqw6aC5NKp4mLQBDxwLiDmfJCz5fAdS2ApMahfJ6oT
         3GLWe7MR0ogx51e8I+wtOe/hiyh3vZBE4PFYXGfZWpnDm/iHXrLJpUM8lyVSZO3hK3/O
         vPhu1du2OHywLQlFB2nvjxeGt3yfhpioYDJ9T6OowaJpncALyhAL9j2q9GL3yu9hZCzJ
         uUTcet2dorP1RMVP8jdwA5fbQuWtpCw78b1mHS6E2+xlPu+Z1D7BtWY8KUzSPGPOO42n
         GTwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ2AldGwn901Mi3hmJn9HclZ+Ivqxhs9Gm2DPEymvmW0/5eMdTzBlnm8bfJcE7qn5zavYZjdr7CkGO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe5tUhsfUYXKHbTLrGY2MV+KnkH6N1SB+g3R5njPySLkPudc+a
	slBS7CJ4IloTZc8wCFT/33dkJ7pShQqw7fVGs8ng9iE7oypvag9iEvnU
X-Gm-Gg: ATEYQzwxtE62FHmSNy+5X0Xos3iNh6a66I0Zyeu1LpIFr0CX3vOEDDrcDxYUWnsE3H1
	98CVFmUg9vkjRtkS7VoYKDjZzSl2WXyKQWUUoaYKEsIl8jqpDG4+K6txXiHAivxbXxsJfeQkSb+
	7hNrmlP4RJjGa36ZIKTNzpWcDxQNDCFBZ2d0I4R+al4k3gBCpjJN1F0UAGslq9xbvSVOpQhxGVn
	teOx/vCWsnZFaLwWW9ye7hiALejB85g7bGSxlRCtf7p1DyQCulKx390xE9LE9ucsFWRqA7pYltv
	dV+NMMag14BXrgAB3yQjvEh94t9Bp4TeOEUFvzDYZiTDqZcsDd/KwGSHu6N9yQaEpQy87E/9PJB
	s1idYpkfixI1NI/00vC2EduLrEP1LAALQOU+Tk51RxFFiK6k083KsPKZbs3i8K0viuofd9DQtPx
	K7FnKamkIKMJPd5PIda855Ns69Ipen4f2+8krBU6VLMo3n+LsLgJ6uoS4VG5WSLXO4USqQj3q8o
	9QuBLe8P2qquvc=
X-Received: by 2002:a05:7301:3d1a:b0:2ba:6978:2b4 with SMTP id 5a478bee46e88-2c1097533admr4453382eec.20.1774230902218;
        Sun, 22 Mar 2026 18:55:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:55:01 -0700 (PDT)
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
Subject: [PATCH 10/10] driver core: class: remove class_find_device_by_of_node()
Date: Sun, 22 Mar 2026 18:54:28 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-10-b72eb22a1215@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7422-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,gmail.com,axentia.se,armlinux.org.uk,intel.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: EF0A92EBAB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

All users of class_find_device_by_of_node() have been converted to
using class_find_device_by_fwnode(). Remove the former.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/device/class.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/linux/device/class.h b/include/linux/device/class.h
index 2079239a5aa5..e6ad009ce70b 100644
--- a/include/linux/device/class.h
+++ b/include/linux/device/class.h
@@ -107,18 +107,6 @@ static inline struct device *class_find_device_by_name(const struct class *class
 	return class_find_device(class, NULL, name, device_match_name);
 }
 
-/**
- * class_find_device_by_of_node : device iterator for locating a particular device
- * matching the of_node.
- * @class: class type
- * @np: of_node of the device to match.
- */
-static inline struct device *class_find_device_by_of_node(const struct class *class,
-							  const struct device_node *np)
-{
-	return class_find_device(class, NULL, np, device_match_of_node);
-}
-
 /**
  * class_find_device_by_fwnode : device iterator for locating a particular device
  * matching the fwnode.

-- 
2.53.0.959.g497ff81fa9-goog


