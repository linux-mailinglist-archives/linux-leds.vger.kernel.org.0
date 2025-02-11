Return-Path: <linux-leds+bounces-3929-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F99CA30F3F
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 16:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA4BD3A11F9
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 15:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2698524F5AA;
	Tue, 11 Feb 2025 15:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQGRmWCX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC4E3C3C;
	Tue, 11 Feb 2025 15:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286481; cv=none; b=M5k2ckxjSqPqkhNQX7ZgsYJq7ZM8hpnpqZUX8lc4h+ytW0ygSvB9pIBlisLZjlOyUIQhx5NzM7M6nXMy4VO1GkrYExeFPMWZ7w1AxIYDSYqxu6/2+5nfkw5T3fJbk5vN5LSTmGBE6WkUMf7i7WsYh9Z2W2cw8LXJo7bYieehi1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286481; c=relaxed/simple;
	bh=lNPUaE77q0AFctgL6amVVXO/TUfnN9RH4g0Cnckt/s0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BaaGRKFXv4N8cct8H52/lMF7AE5d5Rah16XKjba6UtdU/OpwYnz6BfzobO4Qj6eLvoqfZtyGWa9VnhDka59gPIdktR1GyPAKExd8tJ2rssAVEzi/Ojlr+XvCmBGJ8u5cyU7w6T42O9VT++1dbA6LXktH4QkpxgtiA7sphTw9pfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQGRmWCX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D314C4CEDD;
	Tue, 11 Feb 2025 15:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739286480;
	bh=lNPUaE77q0AFctgL6amVVXO/TUfnN9RH4g0Cnckt/s0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bQGRmWCXqvhbdz66JOSQ6E9JHNzpA2U3GGuSVVQ0KERNCdSV3theFvI6QoYRMKlvz
	 7ZhLbISnpWL9/YtSnCRW+vb6FubqpNY9vb05tThmmhE2pyFJjEbcYlTAGhTEAJovoy
	 Yoj9MyVb8AWinPKBJaW7tub/lFUcawT8vs8W4q4s4VlPeRx634YCJPjEUH3RpO39Io
	 nqmfLVbIGpXCc3ZQhk/uiSi/E7kDWz+cypeIRNhMEHdEQBTA0gLyme1zCpU3GxOsb/
	 agjnHt+nhNFsZB7T4LDEW5B4hCTUZwJ1TPaft3NvoUm0q7ivbcesw4fHkK1kCZmgy+
	 rATZ0cTZMxnQg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20250107161628.121685-1-Frank.Li@nxp.com>
References: <20250107161628.121685-1-Frank.Li@nxp.com>
Subject: Re: (subset) [PATCH v2 1/1] dt-bindings: leds: Convert
 leds-tlc591xx.txt to yaml format
Message-Id: <173928647810.2237766.13705317280883831005.b4-ty@kernel.org>
Date: Tue, 11 Feb 2025 15:07:58 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 07 Jan 2025 11:16:26 -0500, Frank Li wrote:
> Convert binding doc leds-tlc591xx.txt to yaml format to fix below DTB_CHECK
> warning.
> 
> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb:
>   /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with compatible: ['ti,tlc59108']
> 
> Additional change:
> - ref to common.yaml for child nodes.
> - limit child's reg to 0 - 7 for ti,tlc59108.
> - fix typo 'linux,default_trigger' in example.
> - change child node name's prefix to led-.
> - change nodename to led-controller.
> - fix properties order in example.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: leds: Convert leds-tlc591xx.txt to yaml format
      commit: 346e704278151149e9b4c6807686ee667b911e77

--
Lee Jones [李琼斯]


