Return-Path: <linux-leds+bounces-3028-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 235E39979B0
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 02:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3C671F22CBD
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 00:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F891E4AB;
	Thu, 10 Oct 2024 00:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfrAgK6D"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1661DFD1;
	Thu, 10 Oct 2024 00:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728520600; cv=none; b=G6lNFUb+jf8/h49q5ogvj/fF7oA0z4iICaeBEawYqxA54uHBBknghbLzPYErbNMrWU+K3kGGTbOYZLReAE3RekWNOdokrTo2u2MFw4/WFL61pdskjz2npISnNxWRplNjQ5i42O4ct2J7qIbfZgJYl2f84Gv2uzH3kXfIxektCcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728520600; c=relaxed/simple;
	bh=YpJurxbhtxGVZO4u+qrJ7lm0WHs8FDf1B1nBWm9/pzI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UFANe24J2BCxnLcF/rA9aqMxrWQwXjFrfKC6elFcCDO3C2yP9JPKxj8pLdbIGw/kPol5t0OXeYypYcVjmGMfpcNQq6Mu1dnSLvzq/G4SSy8hA5uCb+dCb7YRx6yLNufLwNfonHtSD0ZxIV2e9lyZN5sSuO6ZLWnHPB6P5muWIRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfrAgK6D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F25C4CEC3;
	Thu, 10 Oct 2024 00:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728520599;
	bh=YpJurxbhtxGVZO4u+qrJ7lm0WHs8FDf1B1nBWm9/pzI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WfrAgK6D+m8cYCORGr9PUrWj8DdnBX/IVFSbQeuwXN1C1dN/xCa5kWVuNjmqDEo+E
	 sVUMeiXgftrQkizAU0dWsrtIpWp6TbIWT38oS3G2yifvtL66dRveOBNH2Sj1IAuwK4
	 U6kL76KZpny++IvOcH3ZdbTgNrSnvxhW6zC2swSSd0SYyC571mGLKwZWb5pajbt1U1
	 Fn/ytsPJkBeWMK08QQNqM0zf6tSJ+vRUEhQsLnCN/0wvlKbC4cUjvBxJD7eon190cu
	 NFsYeVZIGNesqqDwVhIFGZZSWBMkXIKEutI9M7xExMmB0Pm2wYvhp/WyIxqhF7glsJ
	 ukheP5+5zVNkA==
Date: Wed, 9 Oct 2024 17:36:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee
 Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Xu Liang
 <lxu@maxlinear.com>, Christian Marangi <ansuelsmth@gmail.com>, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>, Robert Marko
 <robimarko@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, Abhishek
 Chauhan <quic_abchauha@quicinc.com>, Jacek Anaszewski
 <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next 1/4] dt-bindings: leds: add 'active-high'
 property
Message-ID: <20241009173638.34edc353@kernel.org>
In-Reply-To: <ZwaF_VNG3TE33rfb@makrotopia.org>
References: <e91ca84ac836fc40c94c52733f8fc607bcbed64c.1728145095.git.daniel@makrotopia.org>
	<4qk3lpdx47b27ru47avpiygijtu5kkax44t3o4wb2wv5m5djoz@uziseiklyq3d>
	<ZwKK4xMlqq3TyDyt@makrotopia.org>
	<6d3hvesqhslk7jaszo44orbaqabl7go6duzpu4beye44sa6lpn@b3c56bp6x3ce>
	<ZwPGbUWImzlbEqb-@makrotopia.org>
	<ZwaF_VNG3TE33rfb@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Oct 2024 14:32:45 +0100 Daniel Golle wrote:
> What is the reason for that? 

No idea.

But we do need an ack from device tree maintainers, I don't see one.

