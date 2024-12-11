Return-Path: <linux-leds+bounces-3567-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 329EB9ECBFA
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2024 13:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AFCE161BB0
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2024 12:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD37E225A30;
	Wed, 11 Dec 2024 12:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4EV8XNz"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E12E1C173F;
	Wed, 11 Dec 2024 12:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733919818; cv=none; b=CRMJKcUqjzLWHnMkGRg/4aYTlIECGALqpFTajOon31EkSnefnWbhhnq+D7mMDw9nGq7XmWtYGw9e/UF67cQJdD4axAq308cLXC9E+GMzN79mzl5ut+Tfsa+9o724a/3+LsTDPzs8jztNNZZVgICoi5xYk91hGHylrPfgrgVONTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733919818; c=relaxed/simple;
	bh=WSG59ETdgfSNPwYnZPVBT4PzI9WJeSCwnLbchtTG9cE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pWEVJRhsEgm+7eAWGW8ZsIVZvgF+rZ9I8B/JdSn1bJgdYyqnWQdYSMNmJObXiHNfPQ4rn25USpBOzbIpm2c76OsShVmxPYBw+/SLLZSpTntgXnd7INbcJAYOM+6FHRPITXb2t27lq7NMBTs862WbSez48hYlMUruL8HHad66/Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4EV8XNz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74FDC4CED2;
	Wed, 11 Dec 2024 12:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733919818;
	bh=WSG59ETdgfSNPwYnZPVBT4PzI9WJeSCwnLbchtTG9cE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U4EV8XNzo2U2xdOCxInBYmjK5Sa0XzxbW2sCNIQzFnO//ImJuC1drm79lw1PkExW5
	 hXGIdzoiNaf0/1mq45x9PuY7z89RtPTHZ3D1AZHuwjxV20mI6QPfC304JjBF0s+HvV
	 xxCx6xlpwGBJNl0fur7OMmQumY7oHGXUPljV3yX8zaYhZLpNJKMLP/UweWt0CNC1IR
	 8jsIxN1BoTkOMBmxct5JI53KCN9aLV4SBKpif8KrGoAB4gyvYEf5V+UqoS4vOhY9Dd
	 yXltENIK4lhm7MPie+aiwpjPtuaGzJg91Qw+PxsY6TFCEECLtvi92+KjPi7RQyhDMC
	 ldk0PG7Z9jBiQ==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <a3c7ea92e90b77032f2e480d46418b087709286d.1731588129.git.geert+renesas@glider.be>
References: <a3c7ea92e90b77032f2e480d46418b087709286d.1731588129.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH] dt-bindings: leds: class-multicolor: Fix path
 to color definitions
Message-Id: <173391981329.781196.3767477778591936759.b4-ty@kernel.org>
Date: Wed, 11 Dec 2024 12:23:33 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 14 Nov 2024 13:44:29 +0100, Geert Uytterhoeven wrote:
> The LED color definitions have always been in
> include/dt-bindings/leds/common.h in upstream.
> 
> 

Applied, thanks!

[1/1] dt-bindings: leds: class-multicolor: Fix path to color definitions
      commit: 609bc99a4452ffbce82d10f024a85d911c42e6cd

--
Lee Jones [李琼斯]


