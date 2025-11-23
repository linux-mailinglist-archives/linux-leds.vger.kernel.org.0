Return-Path: <linux-leds+bounces-6285-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D71C7E666
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 20:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4C468346C58
	for <lists+linux-leds@lfdr.de>; Sun, 23 Nov 2025 19:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1A223D7EB;
	Sun, 23 Nov 2025 19:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Po2ZqhJy"
X-Original-To: linux-leds@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD2E24728E;
	Sun, 23 Nov 2025 19:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763925626; cv=none; b=fOvPwJMbM/MrIL8RBm8lP6R/bkf9NCA2mo5PmOAv8OsCvvezzq+it8///eZHlVz2oNLmPXPqpwEIeGESa7tLSAjakq1OVlcPhHiBEzuamsO3qTKY3EKovIq8kJ3umVjZVWm955RwpoQEvvm9S7vI2mqZmk6FgjLQ4S9fRYnueWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763925626; c=relaxed/simple;
	bh=RDuXRh7G2CHjrL38CVCMGbemIAaIA4+2MGKqIODsmSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfZCQSXU1sFP59y4fvFQ+5qlVMzSVXr/Xxag75z1mccgUfjkxkalTQ0I9oUqVCUDSahU006YQUTVxUqUnXuGkX0Z285TfsBQT2ewun6/1lLLGmTS2VdFfRkwoib08g9hu49ZiENYczyb4OSQ/QslbZAQlTR3nF8r9igQ3OQ0X4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Po2ZqhJy; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=8Ub4QgCGY/ctcqXw+JRgnwpoTjYiVz5wPBPCudCgFo8=; b=Po2ZqhJyibQg6K5zpuq7XJOOzA
	Kro2Ps0ss+vgdPMkNJYjTyvx3Ei0neGWHN2t7d1HhajZRVwQLQCznoezBPByAy+huGhrb3yDTna9/
	o/Q8Uw+OVm4wfAa9CZ5afe4gVtWqeyLh6FsmMhA7qSDF6T40sahd5l+8FvVmu3nINiwBJNwKaWOpQ
	jD7Hy/r1cbDHpRvUsspdoy6oL+YbI3wkvyNgt3EpHYho0d2FwocKZu3nyRxE2wcPM3TQVHzIyIF8c
	sBy9lh+Z+FKlzaXcalc8UKo+zqEaEjWY/gEy9U8Isiwys4EyGvAet/ytCTOSkthTj5S/aWDxtGStF
	eA3au+JA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNFdE-0000000AeFa-0umW;
	Sun, 23 Nov 2025 19:20:20 +0000
Message-ID: <2392c2c1-1367-40ed-81df-f8114a247cd8@infradead.org>
Date: Sun, 23 Nov 2025 11:20:19 -0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 3/3] docs: leds: Document TI LP5812 LED driver
To: Nam Tran <trannamatk@gmail.com>, lee@kernel.org
Cc: pavel@kernel.org, gregkh@linuxfoundation.org,
 christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251123191042.116917-1-trannamatk@gmail.com>
 <20251123191042.116917-4-trannamatk@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251123191042.116917-4-trannamatk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/23/25 11:10 AM, Nam Tran wrote:
> The driver provides sysfs interfaces to control and configure the
> LP5812 device and its LED channels.
> 
> The documetation describes the chip's capabilities, sysfs interface,
> and usage examples.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  Documentation/leds/index.rst       |  1 +
>  Documentation/leds/leds-lp5812.rst | 50 ++++++++++++++++++++++++++++++
>  MAINTAINERS                        |  1 +
>  3 files changed, 52 insertions(+)
>  create mode 100644 Documentation/leds/leds-lp5812.rst
> 

> diff --git a/Documentation/leds/leds-lp5812.rst b/Documentation/leds/leds-lp5812.rst
> new file mode 100644
> index 000000000000..4c22d9a79d14
> --- /dev/null
> +++ b/Documentation/leds/leds-lp5812.rst
> @@ -0,0 +1,50 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +========================
> +Kernel driver for lp5812
> +========================
> +
> +* TI/National Semiconductor LP5812 LED Driver
> +* Datasheet: https://www.ti.com/product/LP5812#tech-docs
> +
> +Authors: Jared Zhou <jared-zhou@ti.com>
> +
> +Description
> +===========
> +
> +The LP5812 is a 4x3 matrix LED driver with support for both manual and
> +autonomous animation control. This driver provides sysfs interfaces to
> +control and configure the LP5812 device and its LED channels.
> +
> +Sysfs Interface
> +===============
> +
> +This driver uses the standard multicolor LED class interfaces defined
> +in `Documentation/ABI/testing/sysfs-class-led-multicolor`.

If you will remove the ` quote marks and add .rst to the filename,
the kdoc system will create a link to that other document.
This is the preferred method.

> +
> +Each LP5812 LED output appears under ``/sys/class/leds/`` with its
> +assigned label (for example ``LED_A``).
> +
> +The following attributes are exposed:
> +  - multi_intensity: Per-channel RGB intensity control.
> +  - brightness: Standard brightness control (0-255)

The 2 lines above should both end with '.' or not end with '.'
(be consistent). They are not sentences so IMO no ending
'.' is needed.

-- 
~Randy


