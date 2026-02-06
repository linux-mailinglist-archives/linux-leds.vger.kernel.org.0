Return-Path: <linux-leds+bounces-6861-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNiAF8clhmlSKAQAu9opvQ
	(envelope-from <linux-leds+bounces-6861-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:32:55 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A43101173
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF5E93037463
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 17:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16123DA7C7;
	Fri,  6 Feb 2026 17:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMJqig8R"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8B13D522E
	for <linux-leds@vger.kernel.org>; Fri,  6 Feb 2026 17:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770398949; cv=none; b=cTVBmVAA93yeKOk/Zhk9u1dgMaU0a008yBNHscCIdiATzHQTuRcgvER4KuWagXwlh4hp3sfO1Nc+9At6zMJIAJMB8FyM9EEzEqoEMFszHtU45xKOC4Ma82zRfz9SaIBrro0DzgYqlxDP+sw29xSfGM9WcYUcOdRY6lazdS+FBTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770398949; c=relaxed/simple;
	bh=DMFf8IatqPgPC4SuwdNqD6eGuSOXIaGvf5N2KhUlJU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t6tGg/q05Z7seU0yGAedcWZZeSysmKfmhNwa8+AGQWH2/Gg63uPMZYj2LOgs3LyDIhiG6J7IrCx87Q/ryXGC5NEApWVE/FUqqyojMqt892Ax0FW/dxcJoD5WFvOYPZeVjW82uWk2VCkYC9s6diT9qeEUOYr9Ovtxg8TgbDn5ADA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMJqig8R; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-4359a16a400so2312131f8f.1
        for <linux-leds@vger.kernel.org>; Fri, 06 Feb 2026 09:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770398948; x=1771003748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jh4BgGzIqnS2YSFnGO3bkqStjslK7T/mmxxxgCr3KOk=;
        b=BMJqig8RAQuaF6pjM+zHc6hkfNZU9rwaBeF9HWG4Dvi+DPHKv4YmQ67Pnzh+tEjdCX
         e5SiaSRpTHNSA1hKL+P0wQ/YOZuzcb+nsaaemzYKpzIacmHipVgXsuBIsLsy7SNVFLfJ
         muJckl4mGi6xGWyf8fPXeHVLqFrVM3M07am108W8GWSet7DK240Fu5/Nv44ZXapyqLUh
         goh66DjKhzTuB8N8dDAecSZmUUjQPYLdBPW19pwiC3mNNPfx9nZoKOLdhXJw4KzzswWr
         Q0PPYytLxv9DL+6GMbvWyJV/Mk7ahUfZqZlIO3os5ROH5HP3NFsgxtrrBD2ED+EfLe6O
         HhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770398948; x=1771003748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jh4BgGzIqnS2YSFnGO3bkqStjslK7T/mmxxxgCr3KOk=;
        b=guRNytAwNRNHNozztbjvDGKFdjz37jblIvoexsQOUGho+PV8atsy0HCQckIkJjX7Gn
         bsuXk99ykdJZW87q4Da7iBalClKLcy57TKj6FW/Id49hWu6WPhArWZx850V1RvXE5ZfR
         JsqpNK4rw0e95ROlb2GRNjd/yt+GLquHaXRrwNm9GNu1kMDhWFDE63TkQYCaWhKNNgSR
         8ewsV4ZR2FzwZsklF2FebibjXERKLvGWiEeJjPox9NsIl4iOI6fGGdnWNBliaXWpJNc8
         ACLk9ysOEqb1fzalyMvSIZBujSIOKkk60uDQFQX9yg2cdnDNdi5ivg2oOaKJXFhZgv8M
         upTw==
X-Forwarded-Encrypted: i=1; AJvYcCWgdqb550TKT1S8WjQyyt/pp2i8RiyvWEi9xKtSKLgS/HIr1Fn988BaKrPj8civ2C9bFUV/kVsayzfL@vger.kernel.org
X-Gm-Message-State: AOJu0YzfQcE3giENpk2ldzTN1eFsZbvR5YPdfp1ylP92sLi4q6DnTzGI
	db6moxNnu1lfNBR1N5i63yVb5WAsvyr4S1RgbU7VRdesSCtFj6pG7JCv
X-Gm-Gg: AZuq6aIvsI2+m1DabBd2hEIhy3Q4FP0VpLaxcUZraAqlQ/ku57FZXe/alKB3ba4FjeG
	4fUWSeQl0zR+5M9OaT2mkVJabpSsItJqmrWOSgBiFTNlNOZ8/DxfGzs+wVPh6nGO+ihq+9+CGwR
	p6id04OLnL3GK/kveK9dDTrupI6rO0Yo//OxrqdKO9MqQzjP3h5WBG3vCEDsuJ14LbxROrHD+KY
	g9S0+i/rNaiugePVMXVNSRvBzB5LrPcH7SMdQTP1VbKfoSHh3q5cNIxEUHr6vTUFMvJvBxDtbcK
	X1u9S9xDd110IvrL97sqN+iPwsplOnvgXGf/W4Y7IpP2i+rbR+2K1cr00Zf27dNfwEd29Z2g8Pe
	5UbE2mVrG6HrzZFulcux1zTQSod4J8gwD4ceQk0KXQEu/7tpwtAFzKIO69DhcnFh4uXwp3n8WTe
	36z58PAf7R3d8=
X-Received: by 2002:a5d:588d:0:b0:435:94f8:e7c6 with SMTP id ffacd0b85a97d-4362933ac28mr4655822f8f.9.1770398947401;
        Fri, 06 Feb 2026 09:29:07 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629734268sm6846033f8f.24.2026.02.06.09.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:29:06 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 00/11] mfd: cpcap: convert documentation to schema and add Mot board support
Date: Fri,  6 Feb 2026 19:28:34 +0200
Message-ID: <20260206172845.145407-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6861-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.991];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F0A43101173
X-Rspamd-Action: no action

The initial goal was only to add support for the CPCAP used in the Mot
Tegra20 board; however, since the documentation was already partially
converted, I decided to complete the conversion to schema too.

The CPCAP regulator, leds, rtc, pwrbutton and core files were converted
from TXT to YAML while preserving the original structure. Mot board
compatibility was added to the regulator and core schema. Since these
were one-line patches, they were not separated into dedicated commits;
however, the commit message notes this for both cases.

Finally, the CPCAP MFD was slightly refactored to improve support for
multiple subcell compositions.

---
Changes in v2:
- fixed code style
- rtc conversion was picked, so patch dropped
- added audio ports description into mfd schema
- splitted schema conversion and compatible addition
- minor style improvements and typo fixes
---

Svyatoslav Ryhel (11):
  dt-bindings: regulator: cpcap-regulator: convert to DT schema
  dt-bindings: regulator: cpcap-regulator: document Mot regulator
  regulator: cpcap-regulator: add support for Mot regulators
  dt-bindings: iio: adc: cpcap-adc: document Mot ADC
  iio: adc: cpcap-adc: add support for Mot ADC
  dt-bindings: leds: leds-cpcap: convert to DT schema
  dt-bindings: input: cpcap-pwrbutton: convert to DT schema
  dt-bindings: mfd: motorola-cpcap: convert to DT schema
  dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
  mfd: motorola-cpcap: diverge configuration per-board
  mfd: motorola-cpcap: add support for Mot CPCAP composition

 .../bindings/iio/adc/motorola,cpcap-adc.yaml  |   1 +
 .../bindings/input/cpcap-pwrbutton.txt        |  20 -
 .../input/motorola,cpcap-pwrbutton.yaml       |  32 ++
 .../devicetree/bindings/leds/leds-cpcap.txt   |  29 --
 .../bindings/leds/motorola,cpcap-leds.yaml    |  42 ++
 .../bindings/mfd/motorola,cpcap.yaml          | 413 ++++++++++++++++++
 .../bindings/mfd/motorola-cpcap.txt           |  78 ----
 .../bindings/regulator/cpcap-regulator.txt    |  35 --
 .../regulator/motorola,cpcap-regulator.yaml   |  51 +++
 drivers/iio/adc/cpcap-adc.c                   |  15 +
 drivers/mfd/motorola-cpcap.c                  | 139 +++++-
 drivers/regulator/cpcap-regulator.c           | 105 +++++
 12 files changed, 787 insertions(+), 173 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml

-- 
2.51.0


