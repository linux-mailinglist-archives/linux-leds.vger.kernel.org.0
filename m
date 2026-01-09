Return-Path: <linux-leds+bounces-6597-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07357D08B9B
	for <lists+linux-leds@lfdr.de>; Fri, 09 Jan 2026 11:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6C9C3003BCE
	for <lists+linux-leds@lfdr.de>; Fri,  9 Jan 2026 10:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3EB7337B86;
	Fri,  9 Jan 2026 10:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cp4LQruZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B106E2F83D8;
	Fri,  9 Jan 2026 10:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767955846; cv=none; b=h03WYuDnSGDkdYjpM3VFLFXpFFII9GhB63xzEXau+0rDbQZPGaR6H4bPWQvmLOhdxQyO0fpaKt7xGZJXMnmdCe6cNA9UKU/7ZXcmLVOITMXTxTP8cnDnMNtreaplHBxuFMPcvxzhxakRakbonmUhjcnmCCSHj0NJfuFQS+gOTDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767955846; c=relaxed/simple;
	bh=S57aJgIJJIoea7ihbtsBUpJbD6YuRQwRMd4E+5Fw+sY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sfol61wF1qwejX1aYeIeW+x51MP8qs/cNQ7cRBUsIgZrpzyxnB5gyS1sgVvbFeYIefMPZEveXJiQc+Yq+Fg8WznBQq8GVXf0OpsQWTuLyegRgeSflWe0wlLVrx/wz7+EZOGbC/w9JfBsQexlu4XEGE4Cfu6Amqu8PJdizzG1pw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cp4LQruZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EADE7C16AAE;
	Fri,  9 Jan 2026 10:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767955846;
	bh=S57aJgIJJIoea7ihbtsBUpJbD6YuRQwRMd4E+5Fw+sY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Cp4LQruZGt2hLr+eqTsQCeoKVykXdaR17B5S/XmuwDtsyD2zFsJSxj6wXnkrLVBD4
	 k22bAUbxlZ+rJioH7nvB936tcE4jzJC2U6g2FfIXo2GXvFSM+CUEramR5FRcpcxqj1
	 ZhuvZ6HDXyt3YVQWIvty4Ugpj5u0JxL4Ab9nLEHfa6O1u6mlAjI5QNqdCqOxwMsGPo
	 h5Zj9hF8D/Hu9iGYNcl2IO2rBZcnNjH7CddR52+a9IIv/PgLq7CJstv+AnMRLADfAs
	 GzI6rgJRHvO/hP+d21H2c8vudl3XprDKT5u3KngyIVmTCeDz1FyC9WtQIayNNzxw2I
	 mPf2xhxseE8xQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
In-Reply-To: <20251217-expresswire-fix-v2-1-4a02b10acd96@dujemihanovic.xyz>
References: <20251217-expresswire-fix-v2-1-4a02b10acd96@dujemihanovic.xyz>
Subject: Re: (subset) [PATCH v2] leds: expresswire: Fix chip state breakage
Message-Id: <176795584369.1637221.16089079913533797869.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 10:50:43 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Wed, 17 Dec 2025 19:14:23 +0100, Duje Mihanović wrote:
> It is possible to put the KTD2801 chip in an unknown/undefined state by
> changing the brightness very rapidly (for example, with a brightness
> slider). When this happens, the brightness is stuck on max and cannot be
> changed until the chip is power cycled.
> 
> Fix this by disabling interrupts while talking to the chip. While at it,
> make expresswire_power_off() use fsleep() and also unexport some
> functions meant to be internal.
> 
> [...]

Applied, thanks!

[1/1] leds: expresswire: Fix chip state breakage
      commit: 25da3f049fb36f6e88e4c4334040b5b0bf9355b7

--
Lee Jones [李琼斯]


