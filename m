Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F16A27586A
	for <lists+linux-leds@lfdr.de>; Wed, 23 Sep 2020 15:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgIWNKo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Sep 2020 09:10:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:57732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726476AbgIWNKo (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 23 Sep 2020 09:10:44 -0400
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3BFA421BE5;
        Wed, 23 Sep 2020 13:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600866644;
        bh=gPdtthN3zIEZHEiesBpvqVcc10/UOJSsYkiCJAIbYLs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Wzm1zYP9v2PTIk7Xs9sw/0GVCkbSwfBwhRlLIuHi+HBgikqBuq26zK7SrTKu0BCgR
         zftdOlt/JBusm9XIZVx4DQ769ne4sJ0bIpjrpuFhVLVAHHnC3Ucnk3ktBvq8vzCRhp
         tIQGVGdp90kVMM3bUwp2QAo/FG5fwUQo/a5Sjpy0=
Date:   Wed, 23 Sep 2020 15:10:40 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <pavel@ucw.cz>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] leds: lm36274: Fix warning for undefined parameters
Message-ID: <20200923151040.2237af86@kernel.org>
In-Reply-To: <20200922190638.5323-2-dmurphy@ti.com>
References: <20200922190638.5323-1-dmurphy@ti.com>
        <20200922190638.5323-2-dmurphy@ti.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 22 Sep 2020 14:06:38 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> Fix warnings for undefined parameters when building with W=3D1.
>=20
> Fixes: 11e1bbc116a75 ("leds: lm36274: Introduce the TI LM36274 LED driver=
")
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/leds-lm36274.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
> index 10a63b7f2ecc..bf6487e9a1f4 100644
> --- a/drivers/leds/leds-lm36274.c
> +++ b/drivers/leds/leds-lm36274.c
> @@ -26,8 +26,8 @@
>   * @lmu_data: Register and setting values for common code
>   * @regmap: Devices register map
>   * @dev: Pointer to the devices device struct
> - * @led_sources - The LED strings supported in this array
> - * @num_leds - Number of LED strings are supported in this array
> + * @led_sources: The LED strings supported in this array
> + * @num_leds: Number of LED strings are supported in this array
>   */
>  struct lm36274 {
>  	struct platform_device *pdev;
> @@ -163,6 +163,7 @@ static struct platform_driver lm36274_driver =3D {
>  	.probe  =3D lm36274_probe,
>  	.driver =3D {
>  		.name =3D "lm36274-leds",
> +		.of_match_table =3D of_lm36274_leds_match,
>  	},
>  };
>  module_platform_driver(lm36274_driver)

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>
