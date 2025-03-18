Return-Path: <linux-leds+bounces-4306-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A97A67002
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 10:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9534D1639D9
	for <lists+linux-leds@lfdr.de>; Tue, 18 Mar 2025 09:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B091FECA7;
	Tue, 18 Mar 2025 09:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTzqeLHQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEEB1ACEB7;
	Tue, 18 Mar 2025 09:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742290864; cv=none; b=mu/4l3J1pewrKcc+P0v6WAl14vLO3Y8gGlaKqfm44ke1ok+7VbKcp2k9uCtcp9TUXmJ6QUMLAB3bHrjyJ0iiNIF+X1bYtISx6WJmS8ScLjP2sh3+yS4jhocEcvtlv9roTDyQ12K+6kt0TPyrWBjMuPGKYcQP8X+XLRxbiTneUHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742290864; c=relaxed/simple;
	bh=TSc5W2q6U2pCETrZtYcwbVySG6HvhFvMTOtr1i1RvG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A20eLn7inOaibQpQ5vJq4wp33dRwez9REx/TPpSb0J7+wu4ZPyhX2MOEVOx4AyzjZMJDP2lYMR/2k/WWt0rtTVs+Gq5qkowzyt1j9GUABUb9l92pRuuwpy7XzOZ63Fi/DgIeScCOQ0pqVq4hx8CRW0DPcVOd7o8Nttj/8s0fV1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTzqeLHQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03B7C4CEDD;
	Tue, 18 Mar 2025 09:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742290863;
	bh=TSc5W2q6U2pCETrZtYcwbVySG6HvhFvMTOtr1i1RvG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cTzqeLHQyr05coLOSUhhzopp77QKqrqw1LJ6Vgr4/UbU3TSEKwOGYDbomUbrtmANr
	 FQuQTnLQ6q0eQ7Vg2ahqmvFAC0IOvAZDEqVSQ9sYktHGOA/+/jbOM/swDyJ1K+VQ/D
	 6uroiAglI7QL5Hwr6KEj0dZyg91Wmfu1D+YBFYTNEKsK+ITQPUUs+vJ089/qIB3pBw
	 Y8faoQwRSqn52e7oIURqnXbe1pREuxojNe1ZEfZ2HsLaHLrwn4ZluVx9c8dF+Po+M0
	 mLXf6oW4/mUSkJOvMfrufE3s7FnlSflw9anSqqZJLb5bh/Wh9JJ+WjUVzmxGcN2xXR
	 lFBkAjTG9SO3g==
Date: Tue, 18 Mar 2025 09:40:59 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, pavel@ucw.cz, jingoohan1@gmail.com, deller@gmx.de,
	simona@ffwll.ch, linux-leds@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 08/11] backlight: lcd: Replace fb events with a
 dedicated function call
Message-ID: <Z9k_qy-Kh3-v5tKg@aspen.lan>
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250306140947.580324-9-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306140947.580324-9-tzimmermann@suse.de>

On Thu, Mar 06, 2025 at 03:05:50PM +0100, Thomas Zimmermann wrote:
> Remove support for fb events from the lcd subsystem. Provide the
> helper lcd_notify_blank_all() instead. In fbdev, call
> lcd_notify_blank_all() to inform the lcd subsystem of changes
> to a display's blank state.
>
> Fbdev maintains a list of all installed notifiers. Instead of fbdev
> notifiers, maintain an internal list of lcd devices.

I don't love the LCD devices list, however I can see the list of notifiers
had the same semantic effect (only less explicit) so I can live with
it ;-).

> v3:
> - export lcd_notify_mode_change_all() (kernel test robot)
> v2:
> - maintain global list of lcd devices
> - avoid IS_REACHABLE() in source file
> - use lock guards
> - initialize lcd list and list mutex
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Happy with these changes, but have the same EXPORT_SYMBOL_GPL()
questions I did with the backlight code.


Daniel.

