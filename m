Return-Path: <linux-leds+bounces-3736-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D498AA0732F
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jan 2025 11:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B9F4188681F
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jan 2025 10:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E090F21518E;
	Thu,  9 Jan 2025 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMLehiCK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F23A201017;
	Thu,  9 Jan 2025 10:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736418647; cv=none; b=qywd3StSzEGSWBiAN0vZ50LmybBe/ZtGbfCOIehW8P2pxP2J8PUMUWnSpSl36SiudZZ2YJhwcjmsVcCnQv25ucd1LRuzfR9gQsp8f98pPffP3w91cGnPiFWTcN+zsVVpjCqzkdkQuF78gGnmjprexJsqodItomXWyrsoGHafsmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736418647; c=relaxed/simple;
	bh=D6fcbSWRWn9yzEmx5MRVWirdFHj8a4fT76swNtjcgp0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qFwOZ2tXiJiw4qMrdUCyiuO5Sr5Zsa9PsJ1Vsy/zAKBUK83yQjCCEmn+2tcCBeop2ncYKEGYHbG9joTMLuuw3RaHpomj3mLA6J86QFsn5HCCE4/goTC2Z/g1SqkyV+3UCUe8GFM/a4fl1ZCWKZhomwnk28cQjVPUZ7JssfyH+O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMLehiCK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47AC8C4CED2;
	Thu,  9 Jan 2025 10:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736418647;
	bh=D6fcbSWRWn9yzEmx5MRVWirdFHj8a4fT76swNtjcgp0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ZMLehiCKl0LzsMf8QY76OFIkDjZwBsRC8ODHpyzrZneZMocc9HPsSGQgsGmACDSDE
	 aB2lDq7WU7h57y+F9L2MkYyCBDW7lQ64HDyc/Bz1i4rZHt/xeNndkEazEBJoCj3gzu
	 pnVMzNiGeQwk7F9e5IbvFaQwayDS1UBjsqyUkLjz4u7Y2EtqGq5Z2JwHaJ/3BG1cvB
	 BhLDkulKLHistxwxXVq17MhLDVWKT9+0KKQqhnUYFlrI46riiYqQkv/pBTGW1GlogA
	 zhaCsDTZmG+3jbJoVPYI+GTznVDBS0hBB238Tg/BowsCuJOIdYn3W9rVMTr4b4aOhz
	 8r+7rxLzvs5BQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
In-Reply-To: <20241218182001.41476-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241218182001.41476-1-vicentiu.galanopulo@remote-tech.co.uk>
Subject: Re: [PATCH v10 0/3] Add LED1202 LED Controller
Message-Id: <173641864500.2570436.16962617577776709228.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 10:30:45 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 18 Dec 2024 18:19:52 +0000, Vicentiu Galanopulo wrote:
> The LED1202 is a 12-channel low quiescent current LED driver with:
>   * Supply range from 2.6 V to 5 V
>   * 20 mA current capability per channel
>   * 1.8 V compatible I2C control interface
>   * 8-bit analog dimming individual control
>   * 12-bit local PWM resolution
>   * 8 programmable patterns
> 
> [...]

Applied, thanks!

[1/3] Documentation:leds: Add leds-st1202.rst
      commit: 132e6687a118cedda0f59ada4af5ce42d0d05043
[2/3] dt-bindings: leds: Add LED1202 LED Controller
      commit: 599b92fd0efa8b7c43e7f58c9dd0f7951f7cbf09
[3/3] leds: Add LED1202 I2C driver
      commit: 939757aafeb9c266dda37657ee5f7a73ffd35ae2

--
Lee Jones [李琼斯]


