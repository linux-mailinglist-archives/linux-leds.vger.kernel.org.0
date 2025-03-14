Return-Path: <linux-leds+bounces-4274-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D037BA60FA8
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 12:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27B973AFBB5
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 11:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0326E16F271;
	Fri, 14 Mar 2025 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsP5NCDM"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D117F1A5B82
	for <linux-leds@vger.kernel.org>; Fri, 14 Mar 2025 11:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741950665; cv=none; b=Vjv7SCLvYD4o1dBrhCcyPGhYz1XE9xyEKt/vH8OIfWezYDA74hofY89S2pTY/vRSyoZHV2n7YGFTtWj8+zkOfZhR+dUo6xp01VwKy6hQbJIm3rZ+0/90jfYtOEtvbKjvJoh4+rPkdoFwtYzj4+/eOCmx9oUpxaM7TNg3vxVGxxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741950665; c=relaxed/simple;
	bh=1J+P8rdC0cVDkpC0MV7YO/oGhlwXLoR+3yJAaL+xuWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSGVCQOmQS0Ul6RMbKLf7TaAKABMd+YW7EGfr++hQnExElB0xN45L38N6MxQnt2pSI8jiTN4N8LySU624WXU78EbBoQsygpmkliVaaifJLIuSsR5NV1WrDSnS3r9kM4dxb1Nz0Mam7dtSP1EtWwNgzxpDyXJ8BaXoqEGnymMMRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsP5NCDM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CB7C4CEE9;
	Fri, 14 Mar 2025 11:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741950665;
	bh=1J+P8rdC0cVDkpC0MV7YO/oGhlwXLoR+3yJAaL+xuWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LsP5NCDMt7tyGLi74ByaJIWErjIV8n2ddPGoNwAzG00sd1/9Mn8Uaf9CKq30KWXVv
	 fqoVH9cN98EpK2VgPtRn9pQN2UAvhmFGKWz+IRFYrui5zxQc2gxfjhyTFf7r2reD2C
	 ZnEHHol9l/wCuzyFiWO/VbKOY4f6NEQcBTH2iISylfLMCTKBwIhRlVCYaMv6xSwTYB
	 cNEZjTLAYEdl+4H+cV9TGtjJRvEpQEaigNuR7ard/UP023BXUil2q4DZBIdFbAOIQ2
	 i6h/grvUx/wa3DYNQCOzSN+O1cKmXfRE5KTXY2Wm2B4EuTVd7k6UkEPY5hay/vSzAL
	 ZWhvR2BkgdpyQ==
Date: Fri, 14 Mar 2025 11:11:02 +0000
From: Lee Jones <lee@kernel.org>
To: Craig McQueen <craig@mcqueen.au>
Cc: linux-leds@vger.kernel.org
Subject: Re: [PATCH v2] leds: Add some setup ioctls to uleds driver
Message-ID: <20250314111102.GI3890718@google.com>
References: <20250311094803.376360-1-craig@mcqueen.au>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311094803.376360-1-craig@mcqueen.au>

On Tue, 11 Mar 2025, Craig McQueen wrote:

> * Add an ioctl for setup as an alternative to doing a write.
>   This is similar to the ioctl that was added to uinput for setup.
> * Add an ioctl to set a default trigger for the LED.
> ---
>  Documentation/leds/uleds.rst |   6 ++
>  drivers/leds/uleds.c         | 124 ++++++++++++++++++++++++++++-------
>  include/uapi/linux/uleds.h   |  30 ++++++++-
>  3 files changed, 136 insertions(+), 24 deletions(-)

Same advice from the previous patch I just reviewed.

Also, please bring all of these uled changes into a single set.

-- 
Lee Jones [李琼斯]

