Return-Path: <linux-leds+bounces-3019-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 184EA996D86
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 16:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC42D286EA9
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 14:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0372719CC28;
	Wed,  9 Oct 2024 14:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYLSgIOn"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC5B19C552;
	Wed,  9 Oct 2024 14:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728483650; cv=none; b=K3XoMoXInFPvzuW8pt9KMc30EvdTd/1phLvN0S4A0gfn2S3vN/3jV4/cj9euz2XU4EbipHwSTrvIJ3qYu9moBFHw7SU1ssjhV0bKU/vGlYgtJBfJ1LlUT+2DlOwYItGwYlh4AQ7B09g/v9A3sGzZCRgCxFm2o+BpsPSJOXZnq9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728483650; c=relaxed/simple;
	bh=QViY9lx7IRmLT83VCb/QN5MYrQn/DBbOjGPf3qXYL5s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bB9gHtScZelvGypDBtQNmdQoEQU8X9pHbJSJjy8aH62xnrOCZ/kwzQ8pCAE5be2emaK1pRtw0OLrQzDEX9YOkz1iUHxem55eWZDM329VfJnMoaRkSSrrmDG8VHebqjuEkhyJeY2gx0qwrzrzhf5ysX/GUijGVYl2dmB75nXHybU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYLSgIOn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D826C4CEC3;
	Wed,  9 Oct 2024 14:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728483650;
	bh=QViY9lx7IRmLT83VCb/QN5MYrQn/DBbOjGPf3qXYL5s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PYLSgIOnaefqWMugYlxXrb0D/Ib2TT0NidJoR91A+I1KWnvbwjXA0TxGSS0XmSl/t
	 e1h6UyqPFeZRjST9LWLXu/xaRjJm09Wwqh+ivTZ2pJHOuW5b1ziZDieAyV1AHxfoh5
	 XlHRXxaULCD77+zDBcjrqONuXkTD9gHK7jaPvJ5oBraQM0/TDKqWKc/tLkoMY/NEwb
	 sgN5WDbkK/YRwUZNth0ww+iuxri65xvNLYd5sOxsUSeL/0hbp4iFspHsDXjOUaYp21
	 i9ADNApYJRTUBPG17ZeZkWmSrrI+wtRizpR3mthj9G/+KycKO84hmPqYJdjET+30xB
	 PmzE+wa1LVh7Q==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, stable@vger.kernel.org
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
Subject: Re: [PATCH 00/18] leds: switch to
 device_for_each_child_node_scoped()
Message-Id: <172848364679.581850.9636321610214125502.b4-ty@kernel.org>
Date: Wed, 09 Oct 2024 15:20:46 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 27 Sep 2024 01:20:51 +0200, Javier Carrasco wrote:
> This series switches from the device_for_each_child_node() macro to its
> scoped variant, which in general makes the code more robust if new early
> exits are added to the loops, because there is no need for explicit
> calls to fwnode_handle_put(). Depending on the complexity of the loop
> and its error handling, the code gets simplified and it gets easier to
> follow.
> 
> [...]

Applied, thanks!

[01/18] leds: flash: mt6360: fix device_for_each_child_node() refcounting in error paths
        commit: 73b03b27736e440e3009fe1319cbc82d2cd1290c
[02/18] leds: flash: mt6370: switch to device_for_each_child_node_scoped()
        commit: 19d1cc765e7d477070ddda02c9a07a1ebcdf4b2d
[03/18] leds: flash: leds-qcom-flash: switch to device_for_each_child_node_scoped()
        commit: f64dd42a4f939fb5acc3f3568ef2118487617996
[04/18] leds: aw200xx: switch to device_for_each_child_node_scoped()
        commit: a361af3c1622d4b8ede54493fa88633fb12201d0
[05/18] leds: cr0014114: switch to device_for_each_child_node_scoped()
        commit: 65135e2ccf5ad0853c1df0ffeefc372066a62909
[06/18] leds: el15203000: switch to device_for_each_child_node_scoped()
        commit: 9e445e28ae0c6fe24369127cf2302cd4f3a1b42b
[07/18] leds: gpio: switch to device_for_each_child_node_scoped()
        commit: 42b49671602f9badb14fd2c32e6791a24d8cbf02
[08/18] leds: lm3532: switch to device_for_each_child_node_scoped()
        commit: 7bd4b9277b9831d115f14d26000c0ba32c83d109
[09/18] leds: lm3697: switch to device_for_each_child_node_scoped()
        commit: 6e2d1d83b70bd736228529fd1cb4f98e0ab77eb8
[10/18] leds: lp50xx: switch to device_for_each_child_node_scoped()
        commit: ba35b9a4c1b074218880c47ca09d19a3c69f904d
[11/18] leds: max77650: switch to device_for_each_child_node_scoped()
        commit: 4ab3ae432da1706b5e1624ecea3c670faaec39d7
[12/18] leds: ns2: switch to device_for_each_child_node_scoped()
        commit: 5b5d936db0d2fb9e81d240ed91d062b8c8f0d224
[13/18] leds: pca963x: switch to device_for_each_child_node_scoped()
        commit: dea90acb09324efe640ab69766c12d8d387ee97f
[14/18] leds: pwm: switch to device_for_each_child_node_scoped()
        commit: e3456071853597229012622c97b76109c0fa8754
[15/18] leds: sun50i-a100: switch to device_for_each_child_node_scoped()
        commit: 8cf103de9a002fb02125491c06d9cd60762d70e5
[16/18] leds: tca6507: switch to device_for_each_child_node_scoped()
        commit: 01728d041986a6992d0b2499e88db4569e65a535
[17/18] leds: rgb: ktd202x: switch to device_for_each_child_node_scoped()
        commit: 48259638fe5986afe8ed2a49e35f0641d953c311
[18/18] leds: rgb: mt6370: switch to device_for_each_child_node_scoped()
        commit: bf3fba727695dcd1ac3f9d17d88845223f56c14f

--
Lee Jones [李琼斯]


