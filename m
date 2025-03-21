Return-Path: <linux-leds+bounces-4351-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB40A6B9E1
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 12:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3DC2189EF3C
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 11:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC6F222574;
	Fri, 21 Mar 2025 11:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSsMPZ2X"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CE72AE6A;
	Fri, 21 Mar 2025 11:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742556449; cv=none; b=FWSKvBFFW64vo6/5txkhM2TE2cWRZ8bcQcMEGWPDx1ZnFxp5ZQrz8iRuSLdNwwp4KQZMG6kQuGAQuuWtMHCGrEqKB23LI/P1MzVPzizzo3Yt7ddOv2Y1ENQceF4fJPlzfsCvU7LtiVdefjIGprPlfXTo8UKLK4+2uuTvVCE7U5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742556449; c=relaxed/simple;
	bh=rvjzcfTIqsBtdQ3O3s16B5g9KwEuLjN4A+GexIfIzZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upmBmNzwNh7+2CML8FhOGXZYepWk7mWrtQ8fd/YZPTKjmNIbQYM/sZVBULkWEqmkhC720MqnhSLw+obYd1JD582NqwN8chblwMferuZc0m89XTpmd3DFrBI+rp/wAxC+zGHzZGyiwb8irjXz/PCTNuWXYAjdM5nLpfYLsl03SRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSsMPZ2X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00132C4CEE3;
	Fri, 21 Mar 2025 11:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742556449;
	bh=rvjzcfTIqsBtdQ3O3s16B5g9KwEuLjN4A+GexIfIzZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RSsMPZ2X1nNcVAJSFt7oZI9povVzRcXbTJFMcT831k7xReWgUtSWrQH9GTWOJa3pg
	 ALsqL8vlJ0n74DbHxSAZPBE/RHnCaIPoZ52E2vuLPQSLiEf5LV4k3c0cgU3v3+lIGm
	 tAPfqpHAVE5cZqgOD68wqCCptLgOhVxBPaSQbBDvbK3cfyEQe2vS/BCio3+SB785CT
	 Ce0sYCMuL+/tSrInQ/UjhPWmnco37Vrs7G2zuOVThx3Q+AhHUU70N66tYlceb0S4DL
	 vHDt9Biy88k2WpwV8axwpnFohs7OOyKy2s0rR+G7N18osea+0KjPBtNBz21XQqXYa9
	 s4w3+6m2O/FcA==
Date: Fri, 21 Mar 2025 11:27:24 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
	simona@ffwll.ch, linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 08/11] backlight: lcd: Replace fb events with a
 dedicated function call
Message-ID: <Z91NHP65X9GFIYOe@aspen.lan>
References: <20250321095517.313713-1-tzimmermann@suse.de>
 <20250321095517.313713-9-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321095517.313713-9-tzimmermann@suse.de>

On Fri, Mar 21, 2025 at 10:54:01AM +0100, Thomas Zimmermann wrote:
> Remove support for fb events from the lcd subsystem. Provide the
> helper lcd_notify_blank_all() instead. In fbdev, call
> lcd_notify_blank_all() to inform the lcd subsystem of changes
> to a display's blank state.
>
> Fbdev maintains a list of all installed notifiers. Instead of fbdev
> notifiers, maintain an internal list of lcd devices.
>
> v3:
> - export lcd_notify_mode_change_all() (kernel test robot)
> v2:
> - maintain global list of lcd devices
> - avoid IS_REACHABLE() in source file
> - use lock guards
> - initialize lcd list and list mutex
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

