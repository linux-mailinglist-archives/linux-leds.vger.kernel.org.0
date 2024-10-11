Return-Path: <linux-leds+bounces-3069-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BCD999E16
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 09:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2597028A4E5
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2024 07:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A39120ADE9;
	Fri, 11 Oct 2024 07:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJpjAVMQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F88209F4D;
	Fri, 11 Oct 2024 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728632255; cv=none; b=u1ARsi0PIoene3ORuPaVQlp6GMd/zGa+5NUMC/u68fCOTjP2Dj2X2fH891MNAa3hXDgPh1nX887g842nCej8xBpieLGCCEuEbOLx9YPo2MmyecOtYGuS9LCO67GA1FMko7y1WSQkfzm9lsiydp0kLTx3OvMn/KlWhTDltf6iy30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728632255; c=relaxed/simple;
	bh=S/xH1Qml/Sx8VPcBePbXZI6iin6x1ngugX1Sjnm9EY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W7/NsHnCSnNd2amamUsGbvumcqOwqH4fLPNCR5LuQUz/qTRmhKTpPBy9WhYXLtbe1Z06MshT7DdaVkgVzRCsYIpgJLSe6/lGpXVBlpWQm5TtvRKzC2/TzG7q/xeGh5bHl8/hG/jwEj18t8moTYjLpSI5w06pYxMP4LnzZRCdt4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJpjAVMQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12560C4CEC3;
	Fri, 11 Oct 2024 07:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728632254;
	bh=S/xH1Qml/Sx8VPcBePbXZI6iin6x1ngugX1Sjnm9EY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cJpjAVMQQJdt86EgsMMt5JXeQcPre6+7kfADgin62kHLtW+eNn4Hx+JqpqaD4s5ND
	 PHQqHzYUZir5PksQrBtEiIZChBjpliv7J2O3C5zjaxXuA0pORHKp7kUIft6mazAw5a
	 lasxEkWyODFWE6pOk5B8dtHqUNm37gPbiXBIbV4bx7LHFWNyfPen7ugK8ibG6TvAZe
	 vJBtmKSUqFM2GyCKRjpnvJjIlVQrpWyiyIgRDqMv275Qf2fVfapiRtcT7bEJV1hjNi
	 RhRZ/t1JMgGxVPngka9hFAS7r9/zVwWMJULuimokAQ9AA6qgwlUM68Y7xA2hjnfQqY
	 nNJj3uN50X2UQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20241010-bcm63138-leds-v4-0-cdb80780a555@linaro.org>
References: <20241010-bcm63138-leds-v4-0-cdb80780a555@linaro.org>
Subject: Re: [PATCH v4 0/4] leds: bcm63138: Add some new bindings and code
Message-Id: <172863225180.3063282.9288774822137994735.b4-ty@kernel.org>
Date: Fri, 11 Oct 2024 08:37:31 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 10 Oct 2024 16:10:49 +0200, Linus Walleij wrote:
> This brings over the few know-how items and little things
> I found about the BCMBCA LEDs in my previous duplicate driver.
> 
> This was tested on the BCM6846-based Genexis XG6846B.
> 
> The main addition is the ability to define the number shifting
> bits in the serial shift register which is necessary if the
> previous boot stages have not set up the hardware properly
> before.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: leds: bcm63138: Add shift register bits
      commit: d19261ffd077609e5d348f1c12894997807a64a8
[2/4] leds: bcm63138: Use scopes and guards
      commit: 61574073e15cbaaab3fa1b2ad7df3ffe21e48509
[3/4] leds: bcm63138: Handle shift register config
      commit: 5f312fdace9cee3fb8a7964469546fb4d8624ff7
[4/4] leds: bcm63138: Add some register defines
      commit: def9c8b7bc0d9d7436cf29eb0106698e356f006d

--
Lee Jones [李琼斯]


