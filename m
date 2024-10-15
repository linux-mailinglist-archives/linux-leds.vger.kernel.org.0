Return-Path: <linux-leds+bounces-3104-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CD499FAFE
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2024 00:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5F8FB20F53
	for <lists+linux-leds@lfdr.de>; Tue, 15 Oct 2024 22:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625371B0F2B;
	Tue, 15 Oct 2024 22:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpofgbVm"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7371B0F22;
	Tue, 15 Oct 2024 22:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729030288; cv=none; b=JoAV/Zz/dhxP4D3AVlZqbSsZOasrhTGz/UhH7sXaDmXnKOYhf27soZW12EZb8R0uRavc3ve2HZDKtfCoSRMcBxUZMvWLgk61xq2jQZaEVB2pMDnavbyMFXZrOYjlGung8LqhQsmJRSuFsIr/EWvb2u3uu0z2+GlLQO4yLIh7UJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729030288; c=relaxed/simple;
	bh=0JOVtQjXTsgrrYUt0yYT9G9Itd9AK2ia3bpVre4KJ/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzD2IDXhtt9qBXqO1Oax0wvlNdMmpjePOiruuaLJDvLVQV+q/qb9oYZ27Yop0Go1+d3lRQk9zyzfODu+CkWn5EvnH4oj9aN0HJeIf/01lrXYXcd8tO7joOPJktqocQs95Rvkw8fAqo5DZrk5aVHQPxhkQdHfffZmpKjegNzIq3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpofgbVm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759BDC4CEC6;
	Tue, 15 Oct 2024 22:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729030287;
	bh=0JOVtQjXTsgrrYUt0yYT9G9Itd9AK2ia3bpVre4KJ/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NpofgbVmwmXDHb/t4/9KGaUOeo1byED/ciDeL46FoDiJ4Rh+JDAsZMhPVbMXhgj01
	 5jNtzQLIBaiKgae/PdIF5zObg/LEpVH3BXdLXt9i6J7ymcV7E0KADa4LYjxs5Vizhd
	 SFRDB8FYvCIV3j9ettPZfG8+FgQhCbbXbvwe3m3Ay6kmDTCsIRdhfzpiRkDyfY7oCH
	 Am4Ql2zELygd5+4q9+CEAX5Y2uQqW2aR+b3hay5xnnvhrDkflIgrp7LGMMM9pnwcbv
	 iCbwiWOW6er08/qO0CxakfPpuC+uITV/85qeErCkS0qxBWOPhSOQ9B8rYYz4IWUc4c
	 2zTv6rDr7WAOA==
Date: Tue, 15 Oct 2024 17:11:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: conor+dt@kernel.org, pavel@ucw.cz, linux-kernel@vger.kernel.org,
	kernel@salutedevices.com, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org, lee@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: leds: pwm: Add default-brightness
 property
Message-ID: <172903027805.2098225.17117451766986744466.robh@kernel.org>
References: <20241015151410.2158102-1-gnstark@salutedevices.com>
 <20241015151410.2158102-2-gnstark@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015151410.2158102-2-gnstark@salutedevices.com>


On Tue, 15 Oct 2024 18:14:09 +0300, George Stark wrote:
> Optional default-brightness property specifies brightness value to be
> used if default LED state is on.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-pwm.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


