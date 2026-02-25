Return-Path: <linux-leds+bounces-7025-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK8OB2Afn2lcZAQAu9opvQ
	(envelope-from <linux-leds+bounces-7025-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 17:12:16 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D51819A4E4
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 17:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68EE7308824E
	for <lists+linux-leds@lfdr.de>; Wed, 25 Feb 2026 16:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB5F3D7D64;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRUKSeHL"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DB038F959;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772035718; cv=none; b=CVXPztO0hILShoD2NouTv7IufUz7kEzx/UJeMViCA6MrW+nqxb5QcH+jukBzDPwF9JzgDtvKP+uBK3SoakNc+Hql080eCQ81YH2ycgHaXy2YJ3FONq04cBMGzdsIouOH8QWwsMLvPD9frlCoF1v4xU9xstN8BC5euPo76haYH+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772035718; c=relaxed/simple;
	bh=1R+1GPZ7oHsV11otnMezIlBcaLhpwQJU4kYs2FxjRqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nL+VerH1s2EHJj0BTpN+2jbAGYhgu0hhnLghPm+cCdQinSo7aW9Rj9OGT51h56He16B376HyLcCwnp9BuLK5iVKHrb8UXjIOxlcInh4G2+5Ir0tfH0Ydst/a4DFsaJAeQ+sdl3IK7s6qrWuH+Qto/z5NZzu1NM+YgN5Uf3V9E2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRUKSeHL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7D7C116D0;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772035718;
	bh=1R+1GPZ7oHsV11otnMezIlBcaLhpwQJU4kYs2FxjRqU=;
	h=From:To:Cc:Subject:Date:From;
	b=FRUKSeHL5v4Yi4cme4faAxkQraoNCEhFqiAL9NAwDPsqOsO9SWGs/vVJDdKFwtNrN
	 DaPbASyGdK9y9nZaZNWi6HzwjXhm5FucDD/+QUFKmCPzBCkYr61QkYrni78/qXijrZ
	 1uLeTJDEkouYuIeIR1diPfHY6NF4Jim6724Z1MXd1R2cZTlsZ99eceEhvoO/C4QV5t
	 tP29mXVCKWYJGdsBB2LmG0TCQLP1aqHRp6rp5XG3byrFAJLOtMQXhFPzgNlCPOZG59
	 HmvH18ZDgN6yOuzGLhVBYYSJKeoBVpMNPRUxnWOwE/QIvdLsYKLfc7J4tuG1uRP/do
	 x5J1JPa1lacRA==
Received: by wens.tw (Postfix, from userid 1000)
	id 963C75FEC5; Thu, 26 Feb 2026 00:08:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs
Date: Thu, 26 Feb 2026 00:08:23 +0800
Message-ID: <20260225160828.1687643-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7025-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6D51819A4E4
X-Rspamd-Action: no action

Hi folks,

This series enables the RGB LEDs found on the Avaota A1 board. The LEDs
are connected in series to the SoC's LED controller.

Patch 1 adds a new compatible string for the LED controller found in the
Allwinner A523 SoC family.

Patch 2 adds a device node for the LED controller to the dtsi file.

Patch 3 enables the LEDs found on the Avaota A1 board.


Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (3):
  dt-bindings: leds: sun50i-a100: Add compatible for Allwinner A523 SoC
  arm64: dts: allwinner: sun55i-a523: Add LED controller
  arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs

 .../leds/allwinner,sun50i-a100-ledc.yaml      |  1 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 22 ++++++++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 41 +++++++++++++++++++
 3 files changed, 64 insertions(+)

-- 
2.47.3


