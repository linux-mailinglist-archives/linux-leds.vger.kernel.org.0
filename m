Return-Path: <linux-leds+bounces-1919-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 637029079F1
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 19:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F404F1F22FB4
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 17:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340B0149C5B;
	Thu, 13 Jun 2024 17:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBLHYm0h"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0C71304BF;
	Thu, 13 Jun 2024 17:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718300063; cv=none; b=PlrSbbcWOQv1DKEWVQJR0sUjnuci+aofydo0Wbx1EhkpJc6eYXg01UiaRuVaWZDwJedrneKpxFtNzSsNrTjBAAjkwj5W/MBhffTH3DDQ3az8/EkJpTBXG6UYuBWrir6PypLkqOb0pABGvnj4Z/zhNMBBOFKhlfUvGt5JGX3q8Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718300063; c=relaxed/simple;
	bh=uq8y9IV3u5SbxvpnajCBPx1S0F6fUsuMA15+er90g/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ud+Dfu0fVPNh7FZVS+ktF9DnM8tNC3JZYPaQQDi8kpJPzj4Mb/mBn3QGXFkMh17YJZ3PamZ73FAYiLK2qmuRCaAb+x+epfDR00CD7mAf5k5pLEzfDCy0sTptZ03yC2zcFhniN5d57MWLJ3sKbZs+iuyvw6SSMoSGC8qG0G1TE5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBLHYm0h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56CFCC2BBFC;
	Thu, 13 Jun 2024 17:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718300062;
	bh=uq8y9IV3u5SbxvpnajCBPx1S0F6fUsuMA15+er90g/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JBLHYm0hDnTwajpj9c2xuRIcbS3jfjsJ3wGK/TNZlfzbSxXyqtC6Lj2gyv1GtUdA/
	 IU+Q9hM4eQdgvgCMU5+Q07qJk+WJOOHK18HauySXsteX5RnlrXWU+R9rZNyvDS7hnt
	 87vByFbRhVzXfPedl1yW8M8wfZBESv6uvik/NMc74jwfsMBuWy7EDFbv18mVLaQh9h
	 54HIIF9hlChYK1Dc6GIAK6CAR3ApYr8NUdOQ46xLfQCrg2rxFNlKilu8/Q4QYZaY5D
	 WxRSTgYeoSM0zVLX2uBiB/31QT9KO+KP+pijfqEGOiNjiUKTf9TJfMERgiIrl8mcpR
	 WvoKCI1v0aJRw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Julia Lawall <julia.lawall@inria.fr>, 
 MarileneGarcia <marilene.agarcia@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240601031713.1307859-1-marilene.agarcia@gmail.com>
References: <20240601031713.1307859-1-marilene.agarcia@gmail.com>
Subject: Re: (subset) [PATCH v3 linux-next] leds: powernv: replace
 of_node_put to __free
Message-Id: <171830006009.2742597.10447114485358333556.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 18:34:20 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Sat, 01 Jun 2024 00:17:13 -0300, MarileneGarcia wrote:
> Use __free for device_node values, and thus drop calls to
> of_node_put.
> 
> The variable attribute __free adds a scope based cleanup to
> the device node. The goal is to reduce memory management issues
> in the kernel code.
> 
> [...]

Applied, thanks!

[1/1] leds: powernv: replace of_node_put to __free
      commit: 7c85503b6d597b84ea58fe3dd95cd9eaeb1f3206

--
Lee Jones [李琼斯]


