Return-Path: <linux-leds+bounces-3434-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4EE9D6B2A
	for <lists+linux-leds@lfdr.de>; Sat, 23 Nov 2024 20:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03F4F2820B4
	for <lists+linux-leds@lfdr.de>; Sat, 23 Nov 2024 19:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7E52FE33;
	Sat, 23 Nov 2024 19:38:05 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CC9195
	for <linux-leds@vger.kernel.org>; Sat, 23 Nov 2024 19:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732390684; cv=none; b=grEhaFJB8u6L1j7sDjRiMul133mcOkyoknqui/jvbrL2TvSfNnch6OlZuh8G9Ayl4QgyO5wIaECT+Isczx/EE5w4x4y6Cfa0v6yyNDJ/zASsQra9QsRa7tztNY52m5m/SqaxQU4jGiRkO7oYyqSuUbiGiODOpgeg/AY0pV1uS4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732390684; c=relaxed/simple;
	bh=v/P84colaqWvSrZoU41qTnj+BoK6c9VtvnimLqokQxY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOmofbVGPbdQcsuFhIEtfLU+nRN7/OpZ2Oub0QvsjPdDiPg5K180u8BwYsox2TngiYlvUKgt78+MoFhDel3Y7l1KxlCUyOjr74VJO50LJeW2KfmmvMJarPze6x82KirosqvxoKV4eeN8dn4DEnZjHqmiUowzzikqEeqpFkPIckM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 724e09f1-a9d2-11ef-827a-005056bdf889;
	Sat, 23 Nov 2024 21:38:00 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:37:59 +0200
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gene Chen <gene_chen@richtek.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 09/18] leds: lm3697: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0IvF_xkWOcGuUnJ@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-9-95c0614b38c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-9-95c0614b38c8@gmail.com>

Fri, Sep 27, 2024 at 01:21:00AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
> 
> After switching to the scoped variant, there is no longer need for a
> jump to 'child_out', as an immediate return is possible.

Same here and so on...
So, please revisit these drivers for the possible improvements.

-- 
With Best Regards,
Andy Shevchenko



