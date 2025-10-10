Return-Path: <linux-leds+bounces-5726-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D16D9BCE331
	for <lists+linux-leds@lfdr.de>; Fri, 10 Oct 2025 20:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEBBF19A7334
	for <lists+linux-leds@lfdr.de>; Fri, 10 Oct 2025 18:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9478E2FC019;
	Fri, 10 Oct 2025 18:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xq9wP7Hh"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B56C2BE652;
	Fri, 10 Oct 2025 18:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760119963; cv=none; b=u7z5cI4LuyI+dLGzKaK/bcMyXw3RJ342g9dbU/SEFlSipu6VSfOY7VcjuG5RH29xDQdMSCTUtWOQqn2dgTYVZB2XrSTEOxNO/PCzwmmfiW8dvX8GW2W7Vb54Zeec6Ity7KdGjDjMh8+lJckC2oGXK35Hk8SmhkZCX52OnBxp2a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760119963; c=relaxed/simple;
	bh=wYrAhnokfwsDSHBME9aVdZy1TeJCHIQGB1vXpHA8XKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Exb5nZI/DzXLiubWjigfngs44IJy8VhuvkIw+MrQZSuuM1QfYZ2fYEKxrug4LZpOggKEY9b14cTTFSkn2vM/4UL1ahvJZcd0qIrfYCpc8Tm4O1m0y7+cLVDvumBgHDRuDYUXHXwNJFWWnt77/1MvRzdc2U6ejXU/Ksnqj2f83rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xq9wP7Hh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F02C4CEF1;
	Fri, 10 Oct 2025 18:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760119963;
	bh=wYrAhnokfwsDSHBME9aVdZy1TeJCHIQGB1vXpHA8XKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xq9wP7HhtMBqPQVQ4V4jT73KnEHM+pcl5VA0ezeoxc11nCHZNJBoZrx7Q000iaubc
	 oQgvUKPjQ4o1s542YwMxs7IHzEMkzJncH+cmZrsimGJVZh8KlDPraDGo1C5CD+1yZ+
	 KLKXCXhD6MmR1KeFTp/TOuqsPU4wDCVB1Po3NUOWLdMk3G/PDU+gff0RUzOI6Qgv/X
	 zGd78VIrUGSV8aY6+jRs0G6gOHgSXePAFbzVHJUsMMMt/tXK7M8eqQLyZhFjDJfgSa
	 hYWnauaqkByk4wbtrzzp95FMFmZj2nJ3AcONnfMnyRp/w+2eDwmePwSyly6msVw1bu
	 /5FeBIG0nat1w==
Date: Fri, 10 Oct 2025 13:12:40 -0500
From: Rob Herring <robh@kernel.org>
To: Jonathan Brophy <professorjonny98@gmail.com>
Cc: lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/4] leds: Add Virtual Color LED Group driver
Message-ID: <20251010181240.GA620330-robh@kernel.org>
References: <20251009084339.1586319-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009084339.1586319-1-professorjonny98@gmail.com>

On Thu, Oct 09, 2025 at 09:43:36PM +1300, Jonathan Brophy wrote:
> From: Jonathan Brophy <professor_jonny@hotmail.com>
> 
> This commit introduces a new driver that implements virtual LED groups
> by aggregating multiple monochromatic LEDs. The driver provides
> priority-based control to manage concurrent LED activation requests,
> ensuring that only the highest-priority LED group's state is active at
> any given time.
> 
> This driver is useful for systems that require coordinated control over
> multiple LEDs, such as RGB indicators or status LEDs that reflect
> complex system states.

Please version your patches because this is not version 1.

This should start with why the existing multi led support doesn't work 
for you or can't be extended in some way for what you want to do. I 
already raised this and now you have the same comments again.

Rob

