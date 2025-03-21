Return-Path: <linux-leds+bounces-4350-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CE1A6B9DD
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 12:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C24F2189EE48
	for <lists+linux-leds@lfdr.de>; Fri, 21 Mar 2025 11:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D459224251;
	Fri, 21 Mar 2025 11:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9VFGP+a"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B4A222582;
	Fri, 21 Mar 2025 11:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742556391; cv=none; b=eJ4Y71Y2Ox+0ESYzE00g0oDlVPWp2fW0jhsP71PIL0IZO3RVuE9hw3BHr5R8QEIgdhAbkUIN53BsKs/XkXAcXoAtC2V7ZlJl+LiDb+PQtMfrNiX+T4Y4bX6BntFSCQoCXMFwCYw6GOsNOKfxP6pvDma3jswmFQI4aU59iNEkUJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742556391; c=relaxed/simple;
	bh=oIXbbNCkaseqpieTiSdrkNX3iw0rOQQiUfY5EkA1+Pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqDbOMYdufRmvQPQdsJA8YvaqxB5OrePp18qTVH6WPfuyZPbzfbna4iG6oVJB5fz5yO9kpoKIgcD8MR2y4PuAMOMzrP0fC1Oj+j1gdYSU+9i3difQEDQLF1TQC+jBlugGglTdYsDzCtMLOy/NxNsAbCPUstczHK7CtqSKB0ffUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9VFGP+a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8A0C4CEE3;
	Fri, 21 Mar 2025 11:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742556390;
	bh=oIXbbNCkaseqpieTiSdrkNX3iw0rOQQiUfY5EkA1+Pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c9VFGP+aMsESMR3fUMqSmy42B1aE3a6EPUk7uOSFDvJ8dGHDZQ0vaIDk6Az+EojrC
	 CofkyQx8ca4WF0lM0kQcQ7SAqZMT7KPa/k7aaSh+6L+LaVTe/0P7QIr6RcWDTYyBsy
	 66JxnYlc6PmzBROANs2yj9kNVyXZ6cCH0/sS3+w6QG7zdtOtBuqjRCTYJRgoCiBtUt
	 rZtKkfB8phCH+xLMbm5tbzBMOmSW/if8/wQ3ylGvnOXhx3nC5XvjcFPeoA0sYV+FHX
	 mNzOGwey3hXy+W7ScDAuSbMHgBqhoEU5dy6VFkQJ+6L3cW8zW3Wec94p4rBw9TPO4F
	 zXGSs0cR6LOIA==
Date: Fri, 21 Mar 2025 11:26:25 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
	simona@ffwll.ch, linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 06/11] backlight: Replace fb events with a dedicated
 function call
Message-ID: <Z91M4fxbAUJOJy5E@aspen.lan>
References: <20250321095517.313713-1-tzimmermann@suse.de>
 <20250321095517.313713-7-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321095517.313713-7-tzimmermann@suse.de>

On Fri, Mar 21, 2025 at 10:53:59AM +0100, Thomas Zimmermann wrote:
> Remove support for fb events from backlight subsystem. Provide the
> helper backlight_notify_blank_all() instead. Also export the existing
> helper backlight_notify_blank() to update a single backlight device.
>
> In fbdev, call either helper to inform the backlight subsystem of
> changes to a display's blank state. If the framebuffer device has a
> specific backlight, only update this one; otherwise update all.
>
> v4:
> - protect blacklight declarations with IS_REACHABLE() (kernel test robot)

I was convinced by the replies to other things in v4. Thanks!

> v3:
> - declare empty fb_bl_notify_blank() as static inline (kernel test robot)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>


Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

