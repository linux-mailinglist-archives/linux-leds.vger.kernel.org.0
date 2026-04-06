Return-Path: <linux-leds+bounces-7633-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP6CJtRB02m7gQcAu9opvQ
	(envelope-from <linux-leds+bounces-7633-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 06 Apr 2026 07:17:08 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 060F13A18AB
	for <lists+linux-leds@lfdr.de>; Mon, 06 Apr 2026 07:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D3013008D0F
	for <lists+linux-leds@lfdr.de>; Mon,  6 Apr 2026 05:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720A7314A8D;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXYTN+An"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415214204E;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775452619; cv=none; b=UC+5SOww8aBUcrvShyAfreWrM0aDKvXLfzdgGXg3HNRlW4wPLNOPN+01f+DNCt+BVJiJnoqp3Wno2DO8IqiwQggab44xjUzvVZCZh53+qIGXddufA0tpYV5/0PUVEe/+mV8o+MFs7QFXp7s7LgSC1JMnoXHEtqbTbx3nZLWvxLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775452619; c=relaxed/simple;
	bh=Mgy1duuWt0vR+mviueizCgI5vS8MuDmlLDbmB0xbpMk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LAm9vDqxICeAcYp0lny8+LVaKLeSMAgoWm7WZQyAv/8VANU2hbiQfKPYyUycUTqnvRm/0M0DMBholG49JEJVM+cUW5zzf0sytWQBsqpLxhk4jN164OTvZP60YBccgnOkKNg83Gc0KdtGYiSYUvAy98kSoNGfu2mTGrOpY4bHnME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXYTN+An; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA9C4C4CEF7;
	Mon,  6 Apr 2026 05:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775452618;
	bh=Mgy1duuWt0vR+mviueizCgI5vS8MuDmlLDbmB0xbpMk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OXYTN+AnGs/YdVN6DJem8778RfBGXNCC9Kaq1ij+hKGvY8xxIf8FM9TBg14VIsswH
	 iNMx1Q1AaxBmwXgNqHxggZbWhq1oCz8R7UqR9p3HwJvMOHb+hnE/csi/t+S1y1xOoD
	 IhQ8IxhkTNAzODSGPMEkw6uw9Iv789NATipDjD9UvlleGZPBvLYKNaIczwog+Jz13c
	 w+zpGcq0zmY0gPzn3xSmDSCZCFL3Doie9pU2nK+F+v+mW9DeV6XqG0zERslFhRO9OI
	 Was+j7CMyazusPShytxygf4ehfjRwbmnnenFfaQlEaNy26jLA8Kw/phlhN7izabL3I
	 5wsEHNMfO6doA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B85E9D818;
	Mon,  6 Apr 2026 05:16:58 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Subject: [PATCH v2 0/4] Describe more hardware of the HTC One (M8)
Date: Mon, 06 Apr 2026 01:16:56 -0400
Message-Id: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMhB02kC/32NMQ6DMAxFr4I8NygJIEqn3qNiSIkBD0Blo6gVy
 t3rcoBufv7fzwcIMqHArTiAMZHQtir4SwHDHNYJDUVl8NY3ztrWLFcTdzEhRtq1q9OgWefCGHw
 NevZiHOl9Kh+98kyyb/w5PyT32/6RJWesaarYhmfVdDW29wVLEUIuN56gzzl/AfqKz4izAAAA
X-Change-ID: 20251007-m8-dts-additions-ac20291afa24
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>, 
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-leds@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775452618; l=1221;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=Mgy1duuWt0vR+mviueizCgI5vS8MuDmlLDbmB0xbpMk=;
 b=3Tt0iAZ6E7HTSlxgNIYL/SaG2UX02aKjPrgvG5Vsw6RtmW2qn6Lj9foVwxIs2s4rY7huMh71e
 27OECyK4cxNBxK3B+fvfm1ZVQ0JhBS9e58EuwJbHEOEtT+wOjrGpKJX
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
Reply-To: alex@me.ssier.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7633-lists,linux-leds=lfdr.de,alex.me.ssier.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[alex@me.ssier.org];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 060F13A18AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add hardware description for these parts of the HTC One (M8):

 - Notification LEDs
 - Bluetooth
 - NFC
 - Touchscreen

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
Changes in v2:
- Rebased on top of 7.0-rc6
- In patch 1, change color of one LED from amber to orange.
- In patch 1, use a multicolor LED to represent the logical grouping
  of the LEDs.
- In patches 2 and 4, note in the commit message the usage of same
  I2C bus frequency as the downstream kernel.
- In patch 3, gather Reviewed-by tag from Konrad Dybcio.
- Link to v1: https://lore.kernel.org/r/20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org

---
Alexandre Messier (4):
      ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
      ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
      ARM: dts: qcom: msm8974pro-htc-m8: add Bluetooth pins
      ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen

 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 94 ++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 4 deletions(-)
---
base-commit: 7aaa8047eafd0bd628065b15757d9b48c5f9c07d
change-id: 20251007-m8-dts-additions-ac20291afa24

Best regards,
-- 
Alexandre Messier <alex@me.ssier.org>



