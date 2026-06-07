Return-Path: <linux-leds+bounces-8528-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7v0OEniMJWp8JAIAu9opvQ
	(envelope-from <linux-leds+bounces-8528-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 07 Jun 2026 17:21:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6EC650D92
	for <lists+linux-leds@lfdr.de>; Sun, 07 Jun 2026 17:21:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=p7KanC7J;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8528-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8528-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 916313013A67
	for <lists+linux-leds@lfdr.de>; Sun,  7 Jun 2026 15:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3160B2BEC27;
	Sun,  7 Jun 2026 15:20:21 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8211EB5C2
	for <linux-leds@vger.kernel.org>; Sun,  7 Jun 2026 15:20:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780845621; cv=none; b=iMbPKKpXJd0t6r7AEfGb7MQ/p2hbV/OEcVw1wLf9qzyZle6ggIOfMR8ZiG4oKqYlq24Et/FXGW9i1/06ydcrVp35mbPnSofdsOL9IHEI7/qQolrgoEuf9QGHz2E5uX8enPhIuOR05jlykwc68nRyE9bp6GlpGKyC43wWFwCLU8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780845621; c=relaxed/simple;
	bh=80jOVn/onXuubNhm+lwLkEGdgFG0fYxEx+qYyDr+7jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qLBQQr4gdlrDLoR/XfHdWyH78VyD7gi7dlJNto9LYPEBAExf9hsdPKuGYCeCO3b9hpa1i3Eht4kEphStjumrsrkuVOsEdqxxSeL/+6JJDPsBREL62XrKFqFvszgxwQOdVfx1mLZhJGKpt2K2bPK4rdPtnSG1DLRjt+F/kbpc2jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7KanC7J; arc=none smtp.client-ip=209.85.216.45
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36b900f350fso3257105a91.0
        for <linux-leds@vger.kernel.org>; Sun, 07 Jun 2026 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780845619; x=1781450419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5kWWkkdo3WKtqhPQ9boJOMkvS3YUTklzOqUSDI8uWAU=;
        b=p7KanC7J+6wPBJM3hVXeNYvBO4rVfBM3TCDnR2bp7RZg8O0MxURpN7Rz1bHgywyN+p
         KBmCNY3dmikKwgl+RqyDGMKdqiPJM3F9j2jn2v67iv/ZQAPDPanOH0hNF3zEHC6QYziY
         RuoaUzJKwwxPccna8Ss/a8ZIRZ124cVcN+HlJB8Ayy8DAzyDN05IyL00Rks9M3pvdE7K
         OprnPxgPS6iFYNx/qawSK7L47S6NcLYDLJsDQLmSwC4wJsW09qtBC2o9ZMKkaEyQlR2C
         q5uc1FC9zFDN93XI27ZJN9kXz9BWaPVDwOM1OlLaTurRGTwZEuJ/iX0yXd3nJQrDrvKF
         XzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780845619; x=1781450419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kWWkkdo3WKtqhPQ9boJOMkvS3YUTklzOqUSDI8uWAU=;
        b=KjC8UV2EB+UbmfO9YyCaserKlOekdgllUwLu2ihqNTSa/ZecPmnrE8+M9Id/vpl1KO
         WYFXNmlFlG2cK4Rh/s8jzaFasdM/0mBVBczkBL2JBgsbTIW4dRKGJ0+OggBBc9DUv0xT
         kfsdoeuPQeRkV82bd4xwmdE8a3YqtMKwLc6DHZuqiW9JNkMstOBVcd9HBAhQGZzvbF+1
         0J4gyBCno1wYogSyQnVtmuzQogh75iylPhGFXA2URF4v5S79FiA5ixiY6uTpF2ZrT9KW
         XxGNx6Q/yvIqXoTv93zLHR1vWjOkqz9shm9tXIchqOv0R5I1U/YMDiVAkx1ZRLL0KVKe
         hdmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mTV4fzfeVLq1X8AJTNaoKMLh5Gsodb1v1oi+Q431/E9n6T0b8s2I6OuZj2c904y3m8pqhxPg88sAH@vger.kernel.org
X-Gm-Message-State: AOJu0YzTJwcjXynl4efV6MYUZWUkpn1E3sESspKgX9vnvVf1jQE+2Bpr
	f4N9PwOkmIFuSBzMGdfzaod68CsuzkQqCpWTX2cE/1hmSF+inouxbWUKYihdXE7bPik=
X-Gm-Gg: Acq92OExXl0BUCov0bwTekHFAaBnmVD0SMkg5A8/bFekcuM0yFd9tUOVoC+vyIAqcwn
	hPzD4QYLVT/kMlsCZljOzD2cW4ayx83fwPdr4CDRZXSV1FKjEqxDxshPs9tyuurLv/rYdlz8BHE
	GX3JGspHEcswYJ1tnCp3i/VKbAIjq4uKW0TRa0Tz2duRZLjiftHHuMhM8lfVsnZyzZ8YR+NJ/9i
	s9q0YPuz45Mx7tKMkAiCh7wLpdoKBVyqpYtNpIqvKg1W8o6lMcxRUavFHRtp6sYfz/xp1uX9WMf
	WncTvvEAklcp8+QLq0Ufo8Cx8KjYhY9dxOrdS5dEXNEmBIsY0GqorCdwjj/xU3ACyaL5jEeQ1Bs
	f6ZtgVa7Zq5HX98L3Y4tLPENF6C3sNTFHZUhZlQOfA2umEgbQ9gxbsSZI9M45CIRALxabO87LRd
	XVu7CarAHQ381F3o/aw6F9dpd/muPNBGeA9HtkzJwmHSVhw14Dpw==
X-Received: by 2002:a17:90a:e185:b0:36b:95f7:564e with SMTP id 98e67ed59e1d1-370ee344778mr12660936a91.2.1780845619092;
        Sun, 07 Jun 2026 08:20:19 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37135861581sm4130659a91.2.2026.06.07.08.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 08:20:18 -0700 (PDT)
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
Subject: [PATCH v8 0/6] leds: Add powerdown gpio for is31fl32xx
Date: Sun,  7 Jun 2026 23:19:56 +0800
Message-ID: <20260607152002.446617-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8528-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luccafachinetti@gmail.com,m:pzalewski@thegoodpenguin.co.uk,m:daniel@zonque.org,m:jerrysteve1101@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD6EC650D92

This patch series primarily adds the powerdown-gpios support
for the IS31FL32xx controller.It also includes a fix and
dt-bindings updates derived from previous attempts [1].

Patch 1 and patch 2 are based on a previous attempt [1].
The driver-related updates in patch 2 have already been merged.

Patch 3 and Patch 4 add support for the powerdown-gpios property,
which corresponds to the SDB pin of the IS31FL32xx series chips.
This pin is used to enter and exit the hardware powerdown mode.

Patch 5 fixes errors introduced by previous changes. It impacts
the brightness control function of the IS31FL3236.

Patch 6 resolves regression caused by prior changes,
and fixes the 22kHz PWM output functionality for IS31FL3236A.

[1] https://lore.kernel.org/all/20250723-leds-is31fl3236a-v6-0-210328058625@thegoodpenguin.co.uk/

Changes in v8:
- Fix code and commit message style issues noted by Lee Jones.
- https://lore.kernel.org/all/20260520135659.1430008-1-jerrysteve1101@gmail.com

Changes in v7:
- Fix code style (spaces/tabs) and commit messages per checkpatch.pl outputs
- Link to v6: https://lore.kernel.org/all/20260520133343.1423946-1-jerrysteve1101@gmail.com/

Changes in v6:
- Add fix for 22kHz PWM output regression on IS31FL3236A
- Correct typo in vendor prefix for Integrated Silicon Solution
- Restore hardware shutdown state upon driver removal
- Link to v5: https://lore.kernel.org/all/20260508131139.1523597-1-jerrysteve1101@gmail.com/

Changes in v5:
- Adjust the unit-address in dt-binding to hex addresses, and remove unnecessary if/then constraints.
- Link to v4: https://lore.kernel.org/all/20260505145354.1267095-1-jerrysteve1101@gmail.com/

Changes in v4:
- Fixed compilation build errors due to missing header files
- Link to v3: https://lore.kernel.org/all/20260429154449.730880-1-jerrysteve1101@gmail.com/

Changes in v3:
- Replace shutdown-gpios with powerdown-gpios, follow gpio-consumer-common binding.
- Link to v2: https://lore.kernel.org/all/20260428023401.330308-1-jerrysteve1101@gmail.com/

Changes in v2:
- Fix $id mismatch with file name in dt-binding.
- Link to v1: https://lore.kernel.org/all/20260428003412.322032-1-jerrysteve1101@gmail.com/

Jun Yan (6):
  dt-bindings: leds: issi,is31fl32xx: convert the binding to yaml
  dt-bindings: leds: issi,is31fl32xx: add support for is31fl3236a
  dt-bindings: leds: issi,is31fl32xx: Add powerdown-gpios property
  leds: is31fl32xx: Add powerdown pin for hardware shutdown mode
  leds: is31fl32xx: Fix missing brightness_steps for is31fl3236
  leds: is31fl32xx: Move pwm frequency setting to init_regs()

 .../bindings/leds/issi,is31fl32xx.yaml        | 187 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 -----
 drivers/leds/leds-is31fl32xx.c                |  34 ++--
 3 files changed, 210 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

-- 
2.54.0


