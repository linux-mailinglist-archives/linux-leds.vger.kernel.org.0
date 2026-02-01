Return-Path: <linux-leds+bounces-6803-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKi+AIMuf2kZlQIAu9opvQ
	(envelope-from <linux-leds+bounces-6803-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 01 Feb 2026 11:44:19 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 626E3C576C
	for <lists+linux-leds@lfdr.de>; Sun, 01 Feb 2026 11:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7736C3011C7E
	for <lists+linux-leds@lfdr.de>; Sun,  1 Feb 2026 10:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAFF322C66;
	Sun,  1 Feb 2026 10:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gROvpyKY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB15F2DCF55
	for <linux-leds@vger.kernel.org>; Sun,  1 Feb 2026 10:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942654; cv=none; b=DXoaoIe3dc6jSxspLzrgkDaWKaktQG4PlcVAGqtpEmwGN467Ub2Zo3CthlHNLvSb0GsEQA2MywgKerfqoqxad9OGwm4r07/kPhECCEIxi8d9v1wdXnrYizxN0YqOEs+AOlHKEo3u1y8YzjZp4obL+4WEeyxSoocTVTtbA7JVD1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942654; c=relaxed/simple;
	bh=z0OeZ0DJQ0E/+donS2QQkMz+d62Uv6TmN9IynwMz9Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JHAkqly10HDbKbWlaIBV6akEZ23wNLSU4n8RB5MnGenDfb5OkirK1hdP6U3pA+hvPZaNpeWnyqo3NhuiZcxkQGRlgTHn7/jCR51vjVQRqBAs2dhDdhCJHsfBqKhPd0lTAYOtlaqispfhKaz7VmuwPzWLP2s47/btXnjQuEklmEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gROvpyKY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4807068eacbso29049345e9.2
        for <linux-leds@vger.kernel.org>; Sun, 01 Feb 2026 02:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769942651; x=1770547451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JaZLxb/TpfjjyCLjMdtwmkz7IMvUMrg74EGxr+gYNgs=;
        b=gROvpyKYSnTUJkQJcIzYaiOop7uXsdVdFQGEarkCejwB8yrnhV9oaEndWdSbYbiy3b
         Md9bmHa5C7NpPJrOD5p+eWiYPq6hIk3A2c8DIjbwrIOr8ZkaEAZfsPxsX3maXygqayPA
         LgIoDNSnASA+qeJRMbFh+OkydaJro0BjItd/+qzuZyX2TJLMXb5mRDxb3Ntlg1qxmQOK
         +RZl+xJlegAtnZnoBfTCzAfIJ7+2/Ny1+UBbKUHBl+1pkHvK85q46bRDQOdiwG5G/uTn
         +pkeornbDPnPZJbWV1TuFckhYxqC1m3K2LAyfxlzX1EpN6BM01NuxS4eV3Vz+eJ26IDA
         8VPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769942651; x=1770547451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaZLxb/TpfjjyCLjMdtwmkz7IMvUMrg74EGxr+gYNgs=;
        b=bE+YCENMZwwUjh1Sh5ws15wNLeR/OkcGC2GER4d7x70ZZy+4w3Ev9QF28UCm5ZfBZp
         Ah8c5aZ73gdbcDZ9/+uShkMPyRh46hLMKLikKtToqQezUKtLhfSzd3gLhEuZcC9Ef+LF
         QhEh9ClyITRc0hMLuhVbpNMpqexqhxlNCTBwx3ml11XigJHtPezKXZaD7JXORSCTTE19
         5j0Iv/kGwRvefEPx7SjaV85ufwL+ivKpDh1T4XAn8Z8zVw73N7m8DgB/9T2mqrU2rdVv
         ELACrRdUbbbKqlUqwONVQd1Nq4lZvkvplx3+32fnS+Kmzj0aQmof2Pr4betupVSug8d8
         lhUA==
X-Forwarded-Encrypted: i=1; AJvYcCWsRGMJSO9HljsFu5O2BlFf/EKpus24J9luFLRCeb4O2KSKYW6sCuECPr0KiETdPFa+ldLoNsl3Bw+F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+D2W0xAsT+XL/WWKujiThMvcVSmVlR3Q6SKqHR4vZN6Np9+Dj
	q6HYBSq4YFKLWerSz43qUJp5vXv0B/K0V7kyryLt3a9KKIMmceWP4gpB
X-Gm-Gg: AZuq6aI+hofmq+KbJdXl3Hhkrm7e2C7o65GnNwhrh4DnNO7/0XR0/UfHA7LvDHgxAMC
	ThH0t3b1jwFrdpY3b+eTyrJqjKvu2yj51ps0EOzuF4FDyuvQGSBqkRrZygcR14NtSWXDR/HaHVB
	xDmi/IAt7YzkxHmbncsNsBj8+80H5G8wpQ4Jrpk0e22AHD8JfSppD6GOucWtiHIy2qcCNpKp8N/
	gdP+YfweZ4flcP/O8LM1g0I+s+00FCmY3cs0hGnhDBl9pxG6sczWV6sa/yRXI6QnjiZ2QIlOCpz
	XR0PeHbuYGtTskN/i5ngO2kICmZXr/8rsJVvlN3ExPUsHlVzLPol1/4Ws2tlzzZIQGVxZcwHjJL
	zk3b4luP3AE5C+CJ0QlD1mH5PSjYWYBdbMn5CIOhh74xDPtPfxhc/8dVEfW4BR2puTrdcfMfsx0
	mQpA3drCXXEb4=
X-Received: by 2002:a05:600c:474d:b0:47e:e952:86ca with SMTP id 5b1f17b1804b1-482db4486e9mr105328755e9.2.1769942650796;
        Sun, 01 Feb 2026 02:44:10 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce56490sm308947455e9.12.2026.02.01.02.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 02:44:10 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v1 0/9] mfd: Add support for Asus Transformer embedded controller
Date: Sun,  1 Feb 2026 12:43:34 +0200
Message-ID: <20260201104343.79231-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6803-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,arndb.de,linuxfoundation.org,rere.qmqm.pl,agorria.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 626E3C576C
X-Rspamd-Action: no action

Add support for embedded controller used in Asus Transformers for
managing power and input functions.

Michał Mirosław (7):
  misc: Support Asus Transformer's EC access device
  mfd: Add driver for Asus Transformer embedded controller
  input: serio: Add driver for Asus Transformer dock keyboard and
    touchpad
  input: keyboard: Add driver for Asus Transformer dock multimedia keys
  leds: Add driver for Asus Transformer LEDs
  power: supply: Add driver for Asus Transformer battery
  power: supply: Add charger driver for Asus Transformers

Svyatoslav Ryhel (2):
  dt-bindings: misc: document ASUS Transformers EC Dockram
  dt-bindings: mfd: document ASUS Transformer EC

 .../devicetree/bindings/mfd/asus,ec.yaml      | 153 ++++++
 .../bindings/misc/asus,dockram.yaml           |  40 ++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/asus-ec-keys.c         | 285 +++++++++++
 drivers/input/serio/Kconfig                   |  15 +
 drivers/input/serio/Makefile                  |   1 +
 drivers/input/serio/asus-ec-kbc.c             | 162 ++++++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-asus-ec.c                   | 106 ++++
 drivers/mfd/Kconfig                           |  14 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/asus-ec.c                         | 460 ++++++++++++++++++
 drivers/misc/Kconfig                          |   9 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/asus-dockram.c                   | 327 +++++++++++++
 drivers/power/supply/Kconfig                  |  22 +
 drivers/power/supply/Makefile                 |   2 +
 drivers/power/supply/asus-ec-battery.c        | 282 +++++++++++
 drivers/power/supply/asus-ec-charger.c        | 205 ++++++++
 include/linux/mfd/asus-ec.h                   | 113 +++++
 22 files changed, 2221 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/asus,ec.yaml
 create mode 100644 Documentation/devicetree/bindings/misc/asus,dockram.yaml
 create mode 100644 drivers/input/keyboard/asus-ec-keys.c
 create mode 100644 drivers/input/serio/asus-ec-kbc.c
 create mode 100644 drivers/leds/leds-asus-ec.c
 create mode 100644 drivers/mfd/asus-ec.c
 create mode 100644 drivers/misc/asus-dockram.c
 create mode 100644 drivers/power/supply/asus-ec-battery.c
 create mode 100644 drivers/power/supply/asus-ec-charger.c
 create mode 100644 include/linux/mfd/asus-ec.h

-- 
2.51.0


