Return-Path: <linux-leds+bounces-3927-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8E0A30DD2
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 15:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28C77165F42
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2025 14:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D109224C68D;
	Tue, 11 Feb 2025 14:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OleQUF3y"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F231F1908;
	Tue, 11 Feb 2025 14:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739283073; cv=none; b=XfbeXNy3Fa83d3X0iHvmepBKmmif4Z4Nsg8omcbKSWSPXLkanDF1Ic7kSfrdWxnijQaGwGPJIIi6nPnr914wrKr1At8/Z/PiJt4MRaXFQ9b0Mj0AACXYLNsHYZpoUiSACG1DegIqxmJPYn2lffg+Qwc9/9OTnrldjeROGnqn2ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739283073; c=relaxed/simple;
	bh=v0XjR7wKS7vmy7/txNxgU72aZrpmETgvpsKegYPQTT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlstorC2LLhM/B9LM6v+/CRFyGJpoUe8QYWDtjIW5KZ4QubBLaIJcumiSuRGu6QUH0guHmMdGcFPNKlT5+H7CpN9prExRPNnh7U6KFhV4QRdafeBwqGURc25fj5ulKror6UlyUXlPnEDUMRNts2qq5Yh2DNZOtZ3hfqPWcruDYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OleQUF3y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6558C4CEDD;
	Tue, 11 Feb 2025 14:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739283073;
	bh=v0XjR7wKS7vmy7/txNxgU72aZrpmETgvpsKegYPQTT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OleQUF3yPK+Qe9gXYfq/X6pwvLWYOiA4dFckPykBYmx7w/UTwvYISPvvcwazKDAp+
	 cOG77Mdeg3h8SC41D2N3okELmySEE4JrAQoga1GGhIAaIZ9hErQs/9g82OTXzhtNVm
	 2diFBrUfzFimC3J70V0mLjPxSNy6eC3r0tRtwcKNpn5m/GyOwLKZtM0a2rk/3zRER0
	 VJ1Lg5DwJ8Ba2s7SxxDYEPSkpVQe+4q3qbI1UOUPKYJW/pYiSFnC/2uga6U9fJ9CVX
	 vSLGXea/UMn9jr0QrKabC4r5VOwXJXKsAxQoXaOeSTYIkCjYMgpI7eXR8+6sSU6y+j
	 R/2jJDD1UiwXg==
Date: Tue, 11 Feb 2025 14:11:09 +0000
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: kernel list <linux-kernel@vger.kernel.org>, rafael@kernel.org,
	linux-leds@vger.kernel.org, torvalds@linux-foundation.org
Subject: Re: MAINTAINERS: Move Pavel to kernel.org address
Message-ID: <20250211141109.GV1868108@google.com>
References: <Z6Ow+T/uSv128wdR@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6Ow+T/uSv128wdR@duo.ucw.cz>

On Wed, 05 Feb 2025, Pavel Machek wrote:

> I need to filter my emails better, switch to pavel@kernel.org address
> to help with that.
>     
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> ---
> I guess this should go through the LED tree?

I'm struggling to apply this.

Something is up with your Message-ID.  How is it crafted?

-- 
Lee Jones [李琼斯]

