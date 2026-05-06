Return-Path: <linux-leds+bounces-8012-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Ho5TM5rk+mm3TwMAu9opvQ
	(envelope-from <linux-leds+bounces-8012-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 06 May 2026 08:50:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F574D6C79
	for <lists+linux-leds@lfdr.de>; Wed, 06 May 2026 08:50:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 667C4307136D
	for <lists+linux-leds@lfdr.de>; Wed,  6 May 2026 06:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DD536AB5E;
	Wed,  6 May 2026 06:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJE8m3o0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3731D369996
	for <linux-leds@vger.kernel.org>; Wed,  6 May 2026 06:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050147; cv=none; b=qlxmO3l5K12NGISX6HjfxuwrPKtGGAUwBzdOGHf8Ix14qfoZLBBUWrvdyrsul9vuUrJEafa4s/sfrTeDG2AKTG74qL6kDeRG8fBbF8X06+3tR3aofFxETXNj3Gi8ZnT9hpQ+uIxoWioeJD1E9LrXv8HmfKumVtEXbsUadI9RsjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050147; c=relaxed/simple;
	bh=vF6eGn5qklDVbibC8z7iWkKkeqLbIWPS7CITIPlg/T0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r5UZQ4S7x64jdE4GyXu759YyCtPRppNhmCIMyrYON+KaHTjHb1cgP+V9xeOth4+XvMFsHCCWigXfVrz54h0EIzAhUWo0Qi2FzZbolGfd1mB3BVoriCQDHRoXZHez1MKYbr3Yxp6TXwHp8GExU6Ho9s9ixDjtQmLXYy6y6o4/tXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJE8m3o0; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-448528f4e69so3551826f8f.3
        for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 23:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778050145; x=1778654945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wGaUKl3/SrhNPHaQfJ2QhPN+oX72lXRnFK0yLcce7gI=;
        b=cJE8m3o0DnnNOfZBebwyCWCmjQjeOd/Kkdwwj+IRcf+/4A6f0z0VxVS6SHsO2CSXgL
         TfTMuDiw15ZPGdkGwWabIAFJ97OLkP/A47UixfcCv7OpDEB/1Vked0JmQlje8FG99a1f
         vb+SJQ4sTG+jTb9fDiflPZnwys6pnU6jyxewFs4cGMrSssKmVkG1luPpGto6aRNGPxok
         LjInGs+afNB7LTePXTm48zjXSeG0j+VFDrgBlUKr52foXguc866YsVkVuqwVU6Q9+JPq
         FzKG5bKxCliq0m10o4NvIVmeI2c9N4DIbB3fgXw99ogyX4yVhJ9Zb3JIwNnlqKEWXNVl
         SbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778050145; x=1778654945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGaUKl3/SrhNPHaQfJ2QhPN+oX72lXRnFK0yLcce7gI=;
        b=f193kPAVttZMmtjINg8j0vu8eOaGIOeUee4FlBPgxHe9/eYDm4aVAL2yCykowrxxBe
         SOD7l8KUZ5apqBJLA595gDHecNyQcznQp4sySIQ+f6Yh9oqTZejjk14tPDVpAhbXjGKB
         5Mr/+v2M4WoqfuxeGadj2YO+ZJIvP1e9oUjOnwFkw+dbIb5gXyJ5CitMxN8gk0oLToDX
         GK+h+5dJ3/sbuuU/dPqYdeJ/sJ5MFICPcI4oXqZVj5+8ksOtMoYk3kgzM57Ve6Xu1WX6
         keSth7cGEciBpB1n1H7UkqRqmvFreqCa5al9MrtBeQCugWBQ+zFXMv2f0NwJqQsM3t4z
         SqNg==
X-Gm-Message-State: AOJu0YycEkTVRT8jEQOqGRZG7+Ty+SkvTLGBuYXpgdtw9Q0Q3CyMDm7d
	QKt/caonA76FGMh1qU9Tpgzf6z45QI91B8U3mxpnpTd+xQ7Tlw90Bcfx
X-Gm-Gg: AeBDieuXm6/ydf6RWcDv/fr6tOu6gozNBTp2wPPycQqW2X8sZjT3OWlBOtaXRqWIdDT
	etlVs4N82QMeqX0XCO39K2qoa50tyEJf1nVT3v32K+6ITV5i6ArJp73nb/2jzmNDcRYKeepXokY
	DT9b4AgT4pMJwOqCFM01G+Bm9BYRNiB6NcY304jNsZdg5jagEL242VhzCSi2ZZXom8hRNx2sL1D
	mZq0/uDMc4G6NDJTYVFtPB1nyvCvD3ouau4mFBK49m5msUkPPUeVrRIxwjbZPerm2ajoy3hntQa
	YjX/Ffd/Ly1DhYzQ4NkvuegMIUUGieQZzw0gtbOczP+p2V1vdcCl3KcsniDnZfVC9j/v8gAe7LD
	wytfq56ytLpdYVT7JavBcBW77mUn/ID/oX6KWcesRIR2NRmU0BAW+v43GHcLrrVwyeA079zYWzj
	FivpdPjnNDas3LNcm6uGx0zjw=
X-Received: by 2002:a05:600c:a305:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-48e51f444e4mr23183125e9.19.1778050144442;
        Tue, 05 May 2026 23:49:04 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891d62sm38398835e9.1.2026.05.05.23.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 23:49:03 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v6 0/6] media: lm3560: convert to use OF bindings
Date: Wed,  6 May 2026 09:48:41 +0300
Message-ID: <20260506064847.37795-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 63F574D6C79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8012-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
Remove platform data and switch to OF device tree bindings.

---
Changes in v6:
- fixed swapped current ranges for flash-max-microamp and led-max-microamp
- for_each_available_child_of_node > device_for_each_child_node_scoped
- pm_runtime_get_if_in_use > pm_runtime_get_if_active

Changes in v5:
- schema adjusted to take into account lm3559
- device_for_each_child_node > for_each_available_child_of_node
- lm3559 and lm3560 configuration was diverged with data match
- removed redundant header

Changes in v4:
- fixed current being off by 10 in schema
- label property from schema replaced with modern equivalents
- lm3560_init_device moved before subdev registration
- v4l2_device_unregister_subdev > v4l2_async_unregister_subdev
- added subdevice cleanup if second led registration fails
- added check if "reg" property exists for LED nodes
- added missing fwnode_handle_put if device loop fails
- added bitmap to monitor configured LED id
- added pm_ptr() macro for PM operations pointer

Changes in v3:
- added note regarding lm3559 in the schema commit
- lm3560 power on/off functions converted to be part of PM,
  dropped redundant wrappers

Changes in v2:
- vendor properties swapped with generic LED properties
- added mutex lock usage optimization
- power supply and enable gpio commits squashed into PM
  configuration since they are both required in making
  proper on/off sequence.
---

Svyatoslav Ryhel (6):
  dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
  media: i2c: lm3560: Fix v4l2 subdev registration
  media: i2c: lm3560: Optimize mutex lock usage
  media: i2c: lm3560: Convert to use OF bindings
  media: i2c: lm3560: Add support for PM features
  media: i2c: lm3560: Add proper support for LM3559

 .../devicetree/bindings/leds/ti,lm3560.yaml   | 163 ++++++++
 drivers/media/i2c/lm3560.c                    | 383 +++++++++++++++---
 include/media/i2c/lm3560.h                    |  84 ----
 3 files changed, 479 insertions(+), 151 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml
 delete mode 100644 include/media/i2c/lm3560.h

-- 
2.51.0


