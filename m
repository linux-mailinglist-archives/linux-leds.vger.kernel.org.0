Return-Path: <linux-leds+bounces-8225-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOsGOoDCDWqV3AUAu9opvQ
	(envelope-from <linux-leds+bounces-8225-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:17:36 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E7758F6D7
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1AE430AD206
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 13:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0DE3E5EFF;
	Wed, 20 May 2026 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIGpvZg8"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5073E5EFA
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285459; cv=none; b=ur8X98sdKDnR30Vj7Kkl+LVs72LoJbawNAAEx218nMj/0JKTVA3EXbwJOL55K8I2MV44e96wKwyibUqLSA0gbbnbz4/2fDgq+oNGKmwxV5YvZuc2KikDECgE+1ejsByTnJQGQvG1KzTMt6XzPPuJbbLkOU6CCGyaXmGI3N78TK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285459; c=relaxed/simple;
	bh=XlL2Wdy/ljAyX45jVX9CtWRIi2MY6Y2XxJJ2ea07zTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cFeBlVicUYbs6Bt0pa/ZnDJpr6OknqF61u6S71+ASNL5NwMZaCqlAMppYTQtpRi0f3fn+F/JK8bfqCV/VHfh7PnTWbKy+mzuamM5tQn5zJVEV48yUHlgE2kOXLRkaxolX0KPMUobfxTGjcBDN09ovT8dCct2OQb9ry17+sgnlZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIGpvZg8; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-368f25ff4c4so2494440a91.2
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 06:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779285458; x=1779890258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtNWmSDrnKYrKr76guN8m8K9HLXRTWxrFgm7bXkjKqY=;
        b=GIGpvZg8Q8bnGiNfRXE/yInY6FF4L96taN8teXSvzoEMPwI9/+Dc4HLW8a1YugEs+X
         EQmtKh3k8OklulNV4qdw2A7zT1n+Fq+ee44bhupbl0GoBm6KhMDb1yg9uYGV70xxcLhZ
         gTt+L78Ym1JThYTT9sWeRsgr8AiINsIcoyIAII5x4ebnq5VM4glyG1NbvbR0R4XQXNBa
         vTJlGli1C0Wm6qzGFvCa6cyvgXR2+uerEo4td5dLwKlRTbuqyyuQJ7C5fc7HY/eFleYC
         gJEqvrBPXQQ8S6hHpDKUAgzg2ZTTw8UvH/4jYaCMnoyN2+TZG3Z3iEd0/SEE+7k8Qji7
         wnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285458; x=1779890258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wtNWmSDrnKYrKr76guN8m8K9HLXRTWxrFgm7bXkjKqY=;
        b=dbaYWv+UNn6pYuI/BtwspXjGA5S1VW8Kivb1nuMJRq4jsqE5q8+DcqkZmD0LbFWeVu
         5LJvqGWUH17KpMzh2tW7RS/iaAGm29FD1XdIk5TszvXDHnOJdB3I6UO21mwtZi6I3XDF
         Wdi/1/jPWM65Kp0qPY6IVQOAt65IavvfAYn012TzWjE8QRmuI1y7kgQBXGnN2F31dIUU
         IAePwO+UyGxH0s1g3o5Vd2Z7qZDrwQoq8KDHmndyKE4WRTncLtCEEyE7psuk0LgLge6I
         Ky2NVIxcxJRHAuo08sDonQbcQUXY6hH7o4DGnhx62/V5t51sR0PctKx/iyYgcZQdbfYD
         CN6g==
X-Forwarded-Encrypted: i=1; AFNElJ+lRmxROKH55SuLxcdgjJ+fmQ4TUwWVX3VlMmzgzwJT8tsmPAB/Td+5wftu8g5DvhVN1u+0I40M2re1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnnh9trn+F4yrGR2yLGQrbaMkrAAf15Wz1S/TtRXrK3fYioPaJ
	H5Ynvfi/apGXbBgOsvvD5aFj9NX6623XPJJ3Tq3nRG0+eLEFVSNB3rmo
X-Gm-Gg: Acq92OFGe6oENG/HE5b/xReHa36Vkjo1Kx/mc901EAtvtn9ONZWw6CwZqbsoWU3KF8n
	exSvSDwmaUp9zH4tw4VbLSCOZwGeHWQ/LF8vjlg9HZrVSyHdVEGKYWDdjkL/68TOp7r/8y7kgL+
	IfXyAX+OTBC/9+YXze4FAS+GD//jJD6h+XWHx8cQJqu+PLRBMic41dpHmvHJFMz6iWaSfghoZZo
	EM0OJcGVp5syvjDzKjWd731AaeGMUZz9LVJmPqQWzQaUaAVSZ5ZKo5rHpHQozG25fEJTMsEiJqL
	lgy/rFw0duXPgov/A3IaHNZF3Ur62WSGPU6aI5kj2sXy7EITI5lifjTT4FOKo+9A3yZUOW7bqOz
	ULIHBx4N5AOTYCjoC6A+NJH/+NIksniSqG9f/lMrIRRjKqTv8GmMK0dHt8/Mc/bkfnjUzvFNs46
	Icnv9crpAXWX34bDnX/M166//E0HIZa0iZTeCGn0c=
X-Received: by 2002:a17:90b:48cd:b0:366:346a:6891 with SMTP id 98e67ed59e1d1-36951b82818mr23906168a91.16.1779285458103;
        Wed, 20 May 2026 06:57:38 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369572e1007sm7480867a91.6.2026.05.20.06.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:57:37 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v7 5/6] leds: is31fl32xx: Fix missing brightness_steps for is31fl3236
Date: Wed, 20 May 2026 21:56:58 +0800
Message-ID: <20260520135659.1430008-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
References: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8225-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 64E7758F6D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing brightness_steps for is31fl3236 to fix brightness control.

Fixes: a18983b95a61 ("leds: is31f132xx: Add support for is31fl3293")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 5b9ed5a1818f..2d7ff4c5a08c 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -491,6 +491,7 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
+	.brightness_steps			= 256,
 };
 
 static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
-- 
2.54.0


