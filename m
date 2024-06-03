Return-Path: <linux-leds+bounces-1815-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5745D8D79FE
	for <lists+linux-leds@lfdr.de>; Mon,  3 Jun 2024 03:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 911861C20B3F
	for <lists+linux-leds@lfdr.de>; Mon,  3 Jun 2024 01:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391654A15;
	Mon,  3 Jun 2024 01:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxE8Y2X+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C04946AF;
	Mon,  3 Jun 2024 01:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717379878; cv=none; b=uw1QaOXZpUJfg+eMjsStLMlElBV8bcL3TxNUv+iXXVs6njkrc58Gs4DpDTGvEUabNOPHgqRUAb1/W/Ly73iX/yNKMOvQShjqP03G6Xbv8Y/kshOATnhjA7CWYZp8Xes6XU2m2RKjIf81rIDC+0qatAfQQDMQ1RXHsVz2ag49P5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717379878; c=relaxed/simple;
	bh=UR24deODs0vzjwIjs6P1tJYa/2xSn9mjXRIqWCMlMYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjdQ5t+wPhKkCBcYEa0QmEog7E/ab7oS0pI7IyqydERvvsDRnd6FI1/gP2+fSXlTKqAhNlLrYpVj5D1OWW7xBfuT56fiQnH33KSXJzbg5AV6EfXBMr2u7x6RWpiNlbmESYg/0Tcn9VA2QT2WsBSSHrPsnXTB4IzT8Q9RBLKoS+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxE8Y2X+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62B0C2BBFC;
	Mon,  3 Jun 2024 01:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717379877;
	bh=UR24deODs0vzjwIjs6P1tJYa/2xSn9mjXRIqWCMlMYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dxE8Y2X+3Y5HlleRUUyGpmnk+bPRw+LoYCLaKrXypWk2wAME4Rzc9uGx1Iu02aG6+
	 BppmUMe1escHu6cDUXNoHJMN3MZYiOv2qTpgoTloJmVTLiqGjXoRENqiUCbHPQkPHN
	 12g7JqUBRxp84Qsnv8nlCOwafSW7s93MXdZ6lj7NhDvdBGRM+/jPi2mXM4sKvfOt4C
	 78u9865MiV9kWt+FFhzJ2uC8ecDLrmrmrerAdMc9w067iO0s8xwmJiAxw9Ae2kWYxO
	 FstFFNd9HtirdZKDTLVijaPY5sY2A0+IQJ/W5KOIToCk3PWW9pGeYB3GDN5CfeYSBc
	 XhixHbLbaaQuw==
Date: Mon, 3 Jun 2024 01:57:53 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, Pavel Machek <pavel@ucw.cz>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dustin Howett <dustin@howett.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-leds@vger.kernel.org,
	Rajas Paranjpe <paranjperajas@gmail.com>
Subject: Re: [PATCH v3 3/4] platform/chrome: cros_kbd_led_backlight: allow
 binding through mfd device
Message-ID: <Zl0jIZbIKV6mG12I@google.com>
References: <20240526-cros_ec-kbd-led-framework-v3-0-ee577415a521@weissschuh.net>
 <20240526-cros_ec-kbd-led-framework-v3-3-ee577415a521@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240526-cros_ec-kbd-led-framework-v3-3-ee577415a521@weissschuh.net>

On Sun, May 26, 2024 at 08:17:17PM +0200, Thomas Weiﬂschuh wrote:
> The ChromeOS EC used in Framework laptops supports the standard CrOS EC
> keyboard backlight protocol.
> However the firmware on these laptops doesn't implement the ACPI ID
> GOOG0002 that is recognized by cros_kbd_led_backlight and they also
> don't use device tree.
> 
> Prepare the existing cros_kbd_led_backlight driver to be probed through
> the CrOS EC mfd device which works without ACPI or OF support.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

The patch overall looks good to me but it depends on previous patch in the
series (for LED_REJECT_NAME_CONFLICT).  Let's wait for review.

