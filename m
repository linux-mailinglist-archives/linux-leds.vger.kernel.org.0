Return-Path: <linux-leds+bounces-4605-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C161AAFD2F
	for <lists+linux-leds@lfdr.de>; Thu,  8 May 2025 16:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54B887B9EA6
	for <lists+linux-leds@lfdr.de>; Thu,  8 May 2025 14:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19435272E5F;
	Thu,  8 May 2025 14:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="slGT59Rp"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E586A272E5E;
	Thu,  8 May 2025 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714896; cv=none; b=HHuaCqgZkvMuBT3fbNLQ8ornraAIsglM2lWj1zAaPzwqvTlD3+2prsJVXlOFlW3bbqvyyDrnHYPDvuMwU3rOTNeG1j4nKt/cQNLh2xvbG4NAKFq4lEnT82vVFwGI9ZDdy7/drqvVmQknOFUVBIV8ZEOljbzjm1Fa75hKtA6lMnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714896; c=relaxed/simple;
	bh=K0M7IMdnkdru4b3GA+is4PSIHP8NkQLHYlg039Zu5Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3WvLuN3RJTYH/QoNyvUP2eoZ2dNzsfU/vtJ1dKE6UuCQ2gciDQO66UPTkr7kwbf9ZTasKbC+n1kG5nUf0IWHkHlVkIP1ewqZ+mwHkEFLMHp2D7paMcPNl5G00Fc9HAKUi0Ypxzd5tAdSNCFdrPn0KtgUvqQO6Rpzmdqcrw26hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=slGT59Rp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB024C4CEE7;
	Thu,  8 May 2025 14:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746714895;
	bh=K0M7IMdnkdru4b3GA+is4PSIHP8NkQLHYlg039Zu5Tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=slGT59RpZc7gVbegOHKVuxvc+cBPwbM4liR0rlCc+Egr2qgXuaxVfZBDCYei7MwDp
	 V5tz7yA3K6ntmziS4GeztdbkHsBm3ULPlxXbfmDOCgCpiKEBJZ2pQGv2jakpaufB95
	 RpyBybpvaBiAqfqo0dMEMgYa4nfr6O/ADYWjXcC0OsF2gCIfwdh4RJoyDO6afzf1iN
	 8jcIxNCm3MPa9GHwvNjDY5hRR1taFLAq2/l8+EJVqsxiEdoaMrBjM6j8M8VfhJp8EO
	 uvDtkHY0egUXswMAJ7QVdmorEtL7dXejPZVMfT/8ZJ45dNV0fLhUmXx/KdkQy0B17v
	 F/HDICT1ibMdg==
Date: Thu, 8 May 2025 15:34:51 +0100
From: Lee Jones <lee@kernel.org>
To: Ivan Stepchenko <sid@itb.spb.ru>
Cc: Pavel Machek <pavel@kernel.org>, David Lechner <david@lechnology.com>,
	Jacek Anaszewski <j.anaszewski@samsung.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] leds: uleds: fix unchecked copy_to_user() in uleds_read()
Message-ID: <20250508143451.GQ3865826@google.com>
References: <20250505081342.3855-1-sid@itb.spb.ru>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250505081342.3855-1-sid@itb.spb.ru>

On Mon, 05 May 2025, Ivan Stepchenko wrote:

> The copy_to_user() is annotated with __must_check, indicating that
> its return value must be checked by the caller. Currently, uleds_read()
> ignores it. If the userspace buffer is invalid and copy_to_user() fails,
> the userspace application may assume it has received fresh data, while
> in fact copying has failed. This can leave applications out of sync
> with the actual device state.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: e381322b0190 ("leds: Introduce userspace LED class driver")
> Signed-off-by: Ivan Stepchenko <sid@itb.spb.ru>
> ---
>  drivers/leds/uleds.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/leds/uleds.c b/drivers/leds/uleds.c
> index 374a841f18c3..41bfce43136c 100644
> --- a/drivers/leds/uleds.c
> +++ b/drivers/leds/uleds.c
> @@ -147,10 +147,13 @@ static ssize_t uleds_read(struct file *file, char __user *buffer, size_t count,
>  		} else if (!udev->new_data && (file->f_flags & O_NONBLOCK)) {
>  			retval = -EAGAIN;
>  		} else if (udev->new_data) {
> -			retval = copy_to_user(buffer, &udev->brightness,
> -					      sizeof(udev->brightness));
> -			udev->new_data = false;
> -			retval = sizeof(udev->brightness);
> +			if (copy_to_user(buffer, &udev->brightness,
> +					 sizeof(udev->brightness))) {

This is not good.

Please store the result into a variable and return that instead.

> +				retval = -EFAULT;
> +			} else {
> +				udev->new_data = false;
> +				retval = sizeof(udev->brightness);
> +			}
>  		}
>  
>  		mutex_unlock(&udev->mutex);
> -- 
> 2.39.5
> 

-- 
Lee Jones [李琼斯]

