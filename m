Return-Path: <linux-leds+bounces-5812-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D38ABEE21C
	for <lists+linux-leds@lfdr.de>; Sun, 19 Oct 2025 11:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD22A4015D1
	for <lists+linux-leds@lfdr.de>; Sun, 19 Oct 2025 09:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318982E1F13;
	Sun, 19 Oct 2025 09:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzMaVwpb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9372E2E1EE1
	for <linux-leds@vger.kernel.org>; Sun, 19 Oct 2025 09:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760865847; cv=none; b=VuiPcif81tPWP6hfjce/YQW3LtTSRGThdu8x1o3Z6DvPIz82vb6dLpzsFaZRwEEddz26Jn/XgVabKq1piYhN/EYWxzCwBrcIiYiUqqqXh1dOQWRI4MW3iQUSVKdgvETsgonb0zBNq07JGOOkoR4qALrVZ46l1k/YujvBlX59qjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760865847; c=relaxed/simple;
	bh=YjKH19Yq3Fp9AlljIlHbdYrwAgfw//vNWx0Hx8pBaZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PTacGTH2S3bVuGyUNCy4hB+oHYJc5g2vPB6d/GaOqsPat7Jd1dY0QDtw6ApqzfF1mEDztRhXAVKjA3LdoX+rQtY3mAb3bzqrKsbYISdkIZAxsRPHIqAtxyZUB1GGj7vv10sZgkYPKOvuwoWxvqwVjv0s9iMp8iYj+e0b6dXHjSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzMaVwpb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29292eca5dbso704155ad.0
        for <linux-leds@vger.kernel.org>; Sun, 19 Oct 2025 02:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760865845; x=1761470645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ldueyFiuHDHfmUi6yqXFVlVFpGrU406mJEGOuagBkc=;
        b=SzMaVwpb2D17HeZ6iCGJLU+0P9FpslkEBSwDz/ZymA6/MpuZOETTHuUtCslTff/tdr
         oKViPqQ0OsMznSjcxB+C9j563IQrM7Jhk6AQmgQTgAvyW72recZiDWuJ8R21vw8ZK33f
         sG7eoyM7bhev3buD6ErV+XlgJOgs3CkPmG+fGjJabH4oI/ue0NCUZb9nR8PEtEQQ7B1J
         1vONNFgaCTbIlzwLfbMs3Dd8YL7MqUmJ+Mfq7hZdeh7npq/0tiI0tFl7CgaYKRKXYm9K
         ebhuD6aE68b4GdVvcSxxIMW2O/dL8RKAfxJwovV6h+7qnMSNKHhOBPsI+WhqSkWYfAYz
         H2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760865845; x=1761470645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ldueyFiuHDHfmUi6yqXFVlVFpGrU406mJEGOuagBkc=;
        b=N3kziCc5nk2hW+/DGxYZcUbXrdYfA6ggBHHqp/XWSMYOaI2bC51ddugSapQOF2BV2n
         2E1zAtuEfJXYGO9JPnvmh5wneTyFYn247kO6vH86J/9G4QPzA2XNEoZZcm5YyWLne2EW
         xf1l73I/syO7V4hMOu1q0rtccgYKNvMEgR06Lk1NQ01PUoTah/TaLzTEwkAgvnldnryp
         wMurrH5KDYVsYe6Sicq+Jnbo6f0g7yTz9mt01u0j/ttspI5jNrT5KGvFaYc4HeXTHjCb
         PJ2tAfFrF8cJsSqgcMAHehmQlkPUGIdV3soP9EfCSuJHLkhKQus3TvAqA659VzyjCoLI
         TLRg==
X-Forwarded-Encrypted: i=1; AJvYcCWW0rb2mP2brr7WAvWCbXbfjtb5POoaGByltln56X1mP1ftlMEdlw5xYbKNOm3JKua2ubTdu8HjqxeM@vger.kernel.org
X-Gm-Message-State: AOJu0YwOjwOuDtheRWe1VbrCyS/pP7jj2RMiGccmgxB8xkgBvDlR/FJW
	TPRM3apDMiiRgGUg+TC3NEGswWXtjP3QCAwx6qsbnn5Huf3+XPkF6weO
X-Gm-Gg: ASbGncu+CqPJ6ZZ9Ln95TxD+97wcV9iMKzcaVVLPuxuOqTIJggcM9jOwAiDeAUCVmRm
	RGUf55POzC/BqJBb9t7MxCilKKm0KfYKrC3h8YrnDTVZt4as7UqXdi7UU+lUZoJ2sYlGYIV+34L
	ERR91yQWq33T7HkNZIf++3Rc6vbK+hERXYFbzuYgHRqGIwakR2/Dc3vHWec8wmJBrXwvQ8oPwxp
	MzjQK3rH38greDiD/Ho8pMPfAWT2SNk1H0ozKOvFemFckm1ePEMmuoP9e/rgzfvhhmSj47o4EUV
	Th0vBU6poP8WXDJvPHVqv8/GsYjAThj/+pYOJ9RZ58R7AaLxc7u9ksIvllzvo+/Twyj4DJhYR50
	NEZVDGg/FEsEgXRmjK0c2n21plZbZOTkglmdFK9RWhYx+Fda+DIWo7M2o+Ry+uBjgcenPWq7viq
	EVwhqyp31AoHwIhF7OU/tHRnOYHkDdbA==
X-Google-Smtp-Source: AGHT+IEeXDzz0B3Eqj8HAvYF0QY4EuJNocnSfMyJANzR5gjTAyXUlR98V5VjK0fEW4mKbvUoBwTmMA==
X-Received: by 2002:a17:903:3d0c:b0:267:af07:6526 with SMTP id d9443c01a7336-290cb65c541mr124630905ad.55.1760865844691;
        Sun, 19 Oct 2025 02:24:04 -0700 (PDT)
Received: from MRSPARKLE.localdomain ([206.83.99.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebd215sm48313115ad.14.2025.10.19.02.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 02:24:04 -0700 (PDT)
From: Jonathan Brophy <professorjonny98@gmail.com>
To: lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v3 0/4] leds: Add a virtual LED driver for groups of
Date: Sun, 19 Oct 2025 22:23:23 +1300
Message-ID: <20251019092331.49531-1-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

Introduce a new driver that implements virtual LED groups,
aggregating multiple monochromatic LEDs into virtual groups and providing
priority-based control for concurrent state management.

Existing multi-LED drivers are primarily intended to group monochrome LEDs
into multicolor LEDs, allowing per-channel intensity control of hue and
brightness. However, they are not designed to manage grouped LEDs with
independent functional roles or shared behavior.

The leds-group-virtualcolor driver allows arbitrary LEDs to be grouped
and exposed as a single logical LED representing a fixed color, status, or
function. Properties such as triggers and brightness are applied to the group
as a whole, rather than to individual LED elements.

This is particularly useful in consumer devices (e.g., routers), where a
single status LED must reflect multiple device states via color or blink
patterns. In such cases, simple device tree bindings are insufficient,
as multiple triggers may activate simultaneously, resulting in color mixing
and ambiguous status indication.

To avoid this problem, the driver implements a priority mechanism that allows
higher-priority LEDs to assume control of the group. When multiple LEDs of the
same priority are active concurrently, the most recently activated LED takes
precedence over earlier ones. If a higher-priority LED is extinguished, a lower-
priority LED will become active.
If an LED is set to blink, or is controlled with an on or off delay, any time
the LED is inactive but still triggered, it will be the only LED in control and
will be extinguished during this time for best contrast.

leds-group-virtualcolor can also enable decomposition of multi-element multicolor
LEDs into individual virtual groups that can provide individual virtual color
LEDs, supporting flexible trigger assignments and precise status representation.

leds-group-virtualcolor can join PWM LEDs into the group with their own bindings
for each primary color this enables per channel dimming and fine tuning of color
of the grouped PWM LEDs.

PWM and monochromatic LEDs can be joined into the same groups sharing the same
grouped global brightness controls.

leds-group-virtualcolor can also expose a singular LED as multiple virtual LEDs,
each having individual triggers, timings, or other properties.

Additionally, traditional bindings can only control individual LED elements,
making it impossible to represent composite colors formed by combinations
of primary RGB components but this is also made possible.

Originally intended to be used with OpenWrt for controlling RGB status LEDs
so control of power, reboot and system upgrade cam mimic the manufactures status
LED mixed colors.
Often when a device ported to OpenWrt RGB status LEDs usually became a glorified
power-led instead of a status led because user scripts or binaries would have to
be implemented as additional packages to control logic.

leds-group-virtualcolor is designed to allow LED behavior to be
fully described and logically controlled in the device tree, enabling early
status indication during system initialization—without relying on user-space
scripts or custom binaries.

Jonathan Brophy (4):
  dt: bindings: Add virtualcolor class dt bindings
  dt-bindings: leds: Add virtualcolor group dt bindings documentation.
  ABI: Add sysfs documentation for leds-group-virtualcolor
  Subject: [PATCH v3 4/4] leds: Add virtualcolor LED group driver

 .../ABI/testing/sysfs-class-leds-virtualcolor |  89 +++
 .../leds/leds-class-virtualcolor.yaml         |  90 +++
 .../leds/leds-group-virtualcolor.yaml         | 110 ++++
 drivers/leds/rgb/Kconfig                      |  17 +
 drivers/leds/rgb/Makefile                     |   1 +
 drivers/leds/rgb/leds-group-virtualcolor.c    | 513 ++++++++++++++++++
 include/dt-bindings/leds/common.h             |   4 +
 7 files changed, 824 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-leds-virtualcolor
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-virtualcolor.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/leds-group-virtualcolor.yaml
 create mode 100644 drivers/leds/rgb/leds-group-virtualcolor.c

--
2.43.0

