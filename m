Return-Path: <linux-leds+bounces-1955-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E40909F18
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 20:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D174B22201
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 18:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D857944C9E;
	Sun, 16 Jun 2024 18:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLRIXrYv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8EA107A9;
	Sun, 16 Jun 2024 18:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718562203; cv=none; b=XTH2TueG7FpawNsWrn4ixeN9D1i3suiHz1ImYiA4hh4lDM6W1QpLu+C2w/9kWYGfTpTLBbHyXiAA7xcDqzhtqX3jrGKvyx/Mk7aQXI2pwW2aVj2oz2iof9V18Bw70pS18rXOV9AfMxCFAyD4HmUKxPqKT3I6V/O1+ul/hy87rLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718562203; c=relaxed/simple;
	bh=+34Fi6O5qk3enPnEGjEgPYKQM4i6AHZtDMRieXM68qU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eyidGdnjOpRXdkgNaqDVdjZPWqznT/OCRJ7uzPGCNIU9ncS7SgvISphrIXstVuTlnK4y1wJ0N7RKaunOxXcuD+tgXtZxA3nhHHmdhH30VpmzAcoVzo5jWWV6szarb1BT2wZ3ssn39G/+RIrbEx9podmfoGy9QL5tupSDqQi/PoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLRIXrYv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2596AC2BBFC;
	Sun, 16 Jun 2024 18:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718562203;
	bh=+34Fi6O5qk3enPnEGjEgPYKQM4i6AHZtDMRieXM68qU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QLRIXrYv1/PFIAT3KjLi6qoG2tycisiPhb8fD+QiW3+ewTZMlC+5AVUQgwCtoORxy
	 CeghWM+UsXt/vXdwdSzxjv0bbP9u8Qsj5bCUrd/NKlHh30rIf7Zw0wOQeiqexyyAvH
	 hBKiB8OO6ivNJWAbIQP1MyxNkbP/1NBNm/+Kt9eYLIPe7KwdKa/eeVKAN8/ioLxhtF
	 YuSZ3VTOuNVkTMzotf3VmG3O45BZSglzpkZk9+vSUE1irQRi+feK9t5tzNs5dJWqZm
	 MnwXXyfymGlkg4KxGqgvZKTNNBXTi38Vq3nm8zBlds5DnGhZsxju45HLTLP43Yt6De
	 ZrExL3kjumePA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E52CC27C53;
	Sun, 16 Jun 2024 18:23:23 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH v4 0/3] Add sy7802 flash led driver
Date: Sun, 16 Jun 2024 20:22:51 +0200
Message-Id: <20240616-sy7802-v4-0-789994180e05@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHstb2YC/2XMQQ6DIBCF4asY1qWBAUS66j2aLhChstEGLKk13
 r1ooqbp8k3m+ycUbfA2oksxoWCTj77v8uCnAplWdw+LfZM3AgKcMBA4jrIigB0nzpROlAIEys/
 PYJ1/r6HbPe/Wx6EP49pNdLluCbklEsUEN7XkumbgtHZX/fTDJ5r2bF9oiSQ4ICd0h5Ahpayii
 mjJefUP2QFLCjtkC7TKGGqkqqX6hfM8fwF9snP3EAEAAA==
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Trilok Soni <quic_tsoni@quicinc.com>, Kees Cook <kees@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718562205; l=2476;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=+34Fi6O5qk3enPnEGjEgPYKQM4i6AHZtDMRieXM68qU=;
 b=gE1fI6YjZgLtdJqRFeFDUaTlcZ3TQBuQL8js73hCZmIO5piaSqxYpd54j3VGkJAtOjPJOwTOX
 XaYAb0oFz0pA2aqfbIUzHsP2UBcnhkiLTQHBiyTV4hX4mvOw1ohOBtc
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

This series introduces a driver for the Silergy SY7802 charge pump used
in the BQ Aquaris M5 and X5 smartphones.

The implementation is based on information extracted from downstream as
the datasheet provided by a distributor of the hardware didn't include
any information about the i2c register description.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
Changes in v4:
- Use for_each_available_child_of_node_scoped() to simplify code
- Use dev_err_probe() to be consistent with the other code in
  sy7802_probe()
- Split devm_add_action() into 2 devm_add_action_or_reset() to simplify
  code and balance regulator_enable()
- Link to v3: https://lore.kernel.org/r/20240612-sy7802-v3-0-1e9cc1c79b79@apitzsch.eu

Changes in v3:
- Add R-b tag to first patch
- Extend driver commit message
- Improve readability of defines by using BIT()
- Rename some variables/parameters
  * led_no -> led_id
  * level -> brightness
  * curr -> fled_{strobe,torch}_used_tmp
  * mask -> {flash,torch}_mask
  * i -> child_num
- Restructure structs ("Place th big stuff at the top")
- Declare 'child' on a separate line
- Move multi-line assignments out of declaration block
- Update warning/error messages and comments
- Use gotos to handle error path
- Use devm API to cleanup module's resources
- Init mutex before LED class device is registered to avoid race
  condition
- Link to v2: https://lore.kernel.org/r/20240401-sy7802-v2-0-1138190a7448@apitzsch.eu

Changes in v2:
- bindings: remove unneeded allOf
- bindings: example: move flash-led-controller under i2c node to fix
  check error
- Cc to phone-devel
- Link to v1: https://lore.kernel.org/r/20240327-sy7802-v1-0-db74ab32faaf@apitzsch.eu

---
André Apitzsch (3):
      dt-bindings: leds: Add Silergy SY7802 flash LED
      leds: sy7802: Add support for Silergy SY7802 flash LED controller
      arm64: dts: qcom: msm8939-longcheer-l9100: Add rear flash

 .../devicetree/bindings/leds/silergy,sy7802.yaml   | 100 ++++
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |  26 +
 drivers/leds/flash/Kconfig                         |  11 +
 drivers/leds/flash/Makefile                        |   1 +
 drivers/leds/flash/leds-sy7802.c                   | 542 +++++++++++++++++++++
 5 files changed, 680 insertions(+)
---
base-commit: 6a03b35e4395eb2d6e89a38aca00a9fe9cb39ba1
change-id: 20240325-sy7802-f40fc6f56525

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



