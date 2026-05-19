Return-Path: <linux-leds+bounces-8203-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OdZIMoiDGrjWwUAu9opvQ
	(envelope-from <linux-leds+bounces-8203-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 10:43:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB2957A5E5
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 10:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 106D130086DB
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 08:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A1F3E8665;
	Tue, 19 May 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mSi+SAFM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1E33E717D
	for <linux-leds@vger.kernel.org>; Tue, 19 May 2026 08:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180228; cv=none; b=IqIzv75W/6Cdt2+21rPQbgoCKCEstddFKGZ+6jC6dAZrA+xpZXE9S0HTKZwnjVi1x0IA6p+44L0UsGrzVegebyyVK4andWCmE1EWLMOKTvUcyn1MC54p2oAo7Hdh7dnfOyEB3GY8uFVV5ce1VnXcMVE0h6+BWc6XdxYIrei4lm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180228; c=relaxed/simple;
	bh=SBsRx6COMWb8PWEHsPOkez+jZUIfIF/PVkJNqhE4ISI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uve17IUpu6JMreJ3P1A//t3atVgVIoJ8iD7+MaCDc1mgQnRip2dESU4uTdlDacifoLhS3Oi5aFcjOlq/44sln/po4koNeKBw96Uc/5n3h1lCuJe7KOuiWCszRzqFRONTgLhoQBSpHScQy8pK7nPu5Z6o8XE4sxrJmZcj9GtM3JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mSi+SAFM; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44509921fbcso1946234f8f.3
        for <linux-leds@vger.kernel.org>; Tue, 19 May 2026 01:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779180223; x=1779785023; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FmS0AK5bqXeh0xlGi+onoeqz5lotlB7Tla6Mg7VB7/0=;
        b=mSi+SAFMgqDpfu2NifGgD9RXIyBIPLxHraaKGpHN6XuXY8C/s8tVOJ3brFKkdVtDnk
         /bUVGTcmN97MYNB8cIQDuBxENtfB8j88yNkJ+fJenv/2Fyk1MItPcBNCzobQf/Wf5AD4
         2AoRUwhmkdTJpeIgdxBRKdLO6XSAz+XvvK+p8Vp336JVlya0zjCgDeqdJmQQaXM0fS2Q
         9GSnKFyDmJkKB+eHRG8Ftem3GPp47ef162VQ2/7FrS7tA5Bv6Z0ZQeyJXJ7Q3lP9hyqL
         dr7P5K/1mn7sWVos2/fa6bJWurg5qTugydic+8SF0IqTTspkIwY/BdC+uf52sV+csMEV
         JKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180223; x=1779785023;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmS0AK5bqXeh0xlGi+onoeqz5lotlB7Tla6Mg7VB7/0=;
        b=cd8QyD2n+oxsBVzgSBS5RYsNcDiKk2PcEXwHA/lPZBjv5xaduOihNy3gZ8elp8pLOm
         Gesyu4DcTuBokX4vplXlCTcVejK+VQCu+oOG+nX1vPMcM2nIk9P4zRsWGfecVN4Hd6qc
         K87857DpTYG4ozVA9FtobzQnfIkp1kqGWAPn9dpcZf1Y62JiwoR5i6qXe1I60BajGcpS
         Npq5BQlr156vf2FY+B3/rVeaBbzP4PUx3KROMyAcIaNOtMygDQCtnrcREbK5OxZo6mVX
         XMFuoNeo536IZGuf21sfCu33Q4lHRFlKGaMVyF8JiNA5vLmWV/MfDsRKXOyvObtHpBDy
         Ndmw==
X-Forwarded-Encrypted: i=1; AFNElJ/7cw+MzdKdEnhivjJhV99b3lQdgPNw9XKrq50g5ESOxrSZfyS7FLOqfK4sRmmdAej06hLDX5Pai5LT@vger.kernel.org
X-Gm-Message-State: AOJu0YwaW51QvZEPY4JbdijmveAQDjgMWo6l5/ll61lmC5jwPmIpRB8V
	chhwXNG8Qc6XCwtwaypBQyuyAzsYQjSzrBR5WqZT0VVTpt89yxLjbQFTsyEZfU/TwHA=
X-Gm-Gg: Acq92OGbue0LV1Nidi6Pobk/cODUX62LZt7h0NX3gOFMBLA+ratj+tmG/TLTJzhB9Lj
	hzeh02hBRuBtGk6k8kfS2VexnhqBMPjq/OP9PJmNjRaafvF/GCgxPIbl5b5Fr9WrPMWPompVdM5
	kgUVwnZTir3oO3TSR7yif5r+TN1cG623wf25dQe8akLdxaGzdHGQee2MHC2aZ2uf/GoS5O1aFw5
	Cm+iPreimT8fF7j5aOD5KZXCzIG6jbdYAKJRE0cWhA6Mqwz0WwaLtwZVQ7FJy5F79bsoRGSg1mQ
	rJLJupwlGa1/80F9QIgZNVqdPEQtzlYIDGV1BpW3A8UuM2Xxe+/Cf+51uHZZ7EVp5WaSkDzjWv2
	Mi7R2srK5EchBbum6YfYOASMiZvTI6tiRmoIlS1+HYsMzXtXVDRERxMqNWB16a2WevaNkfYl5+1
	IQyFW6y89TF87ORzNIgIe4Mfh+HNjXd7BL/tjdBFAxtE8T
X-Received: by 2002:a05:6000:4210:b0:43b:4f86:e985 with SMTP id ffacd0b85a97d-45e5c5dd47amr28790430f8f.33.1779180223003;
        Tue, 19 May 2026 01:43:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe1a41sm47709855f8f.31.2026.05.19.01.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:43:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/2] backlight: Add SY7758 6-channel High Efficiency LED
 Driver support
Date: Tue, 19 May 2026 10:43:37 +0200
Message-Id: <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-0-ec8194bbc885@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALkiDGoC/5WPzQ6CMBAGX8X07JqlpYCefA/joZQF6g8lLRIJ4
 d1t8aI3PU7yZWZ3Zp6cIc8Om5k5Go03tgsgthumW9U1BKYKzDjyDFNewGB7o8Hfi0wiqEl1ZKG
 3+koDeA5+ynNZgMAiIcrrhLhkQdU7qs1zzZzOb/aP8kJ6iO64aI0frJvWO8Yk7v5MjgkgoFaqI
 llXpeDHm+mUszvrGhabI/+wCvzRyoM1fpNilmJF+y/rsiwvRIsjIEEBAAA=
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=SBsRx6COMWb8PWEHsPOkez+jZUIfIF/PVkJNqhE4ISI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqDCK8S/slQPHXNXiiLc2aYeHWz7TKawBWv30dZUIO
 Bdzq9q6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCagwivAAKCRB33NvayMhJ0XWrD/
 9ZkZGEDmabhlVXZ5CFJPKdgl4HPnSgbIpAlrs4w9RkP9cT0IDxI2J9pjhr5x4YRFpvOs6QzMB+d4Lw
 g9FlRycyhX93EgznWHgvhpvjWItJewGSwLOJ/bx+lHK4eBr4faFs/mOJsNXNtH9b5jcmO90q49sreq
 mRHdEngfAO3DMOcZkMEMQr0/+Do3r1fQd+5dfD0qs7kOXC9ZG1jCBvipyUVwWisgKMdHDILdv7sZXv
 zTE15MoylurfnE4m8EkDvTOSEx85N3Ibq4SRRz1psqLOIbhmfJ+gsej1aMQWoh6MZMlINgDXfojFo8
 CLZlIjVDuIh6+lHeW4XOC1NBh/2Xvug09+3nAUFh4MuMPFij9RTS+p1d/tJiLA+6+SCmiZn5pWgcvy
 ZIVmofvjUjEIk6B5RPmqiMvR7RbqnHC5N4FSKHRmpqgGlovDaUa7gelUvkqsLAuR+vECNP+njNU1Zn
 4pPBYMisf+g+t5tt/Uo9l0dOyCsvwmzR/kzwI91BQ2vJzSQDpfPGtEn+dneZLjjLwDl30Yk8MLnej1
 4SrZHx/dvwSYJTs5FW6yXSLRZNeL0gOZ78YnlrFXfP+t+gmUkCCwcaQPajPQ3XbMeAjxrwuw6yvd7m
 LH3MGkaGlvfSUFgi2pwuB5ty4Kn0fUnYEaGfaG1zdOl5XNv1CjonJOJS2byg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8203-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,outlook.com,linaro.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2AB2957A5E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement support for the Silergy SY7758 6-channel High Efficiency LED Driver
used for backlight brightness control in the Ayaneo Pocket S2 dual-DSI panel.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Dropped unused macros
- Added second autho entry to match header and commit message
- Move my signof at the end
- Switched to flseep()
- Link to v2: https://patch.msgid.link/20260430-topic-sm8650-ayaneo-pocket-s2-sy7758-v2-0-308140640de9@linaro.org

Changes in v2:
- Fixed bindings subject and removed "|"
- Added review tag
- Added higher delay before reading ID from HW (100us was too short)
- Removed probe defer if i2c read fails
- Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-0-0caade5fdb32@linaro.org

---
KancyJoe (1):
      backlight: Add SY7758 6-channel High Efficiency LED Driver support

Neil Armstrong (1):
      dt-bindings: leds: backlight: document the SY7758 6-channel High Efficiency LED Driver

 .../bindings/leds/backlight/silergy,sy7758.yaml    |  53 +++++
 drivers/video/backlight/Kconfig                    |   8 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/sy7758.c                   | 259 +++++++++++++++++++++
 4 files changed, 321 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-3081ee7f1e25

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


