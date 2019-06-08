Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E88813A21C
	for <lists+linux-leds@lfdr.de>; Sat,  8 Jun 2019 23:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbfFHVNj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 8 Jun 2019 17:13:39 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:38649 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727456AbfFHVNj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 8 Jun 2019 17:13:39 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 63F458030F; Sat,  8 Jun 2019 23:13:26 +0200 (CEST)
Date:   Sat, 8 Jun 2019 23:13:18 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/2] Use usleep_range() for better precision timings
Message-ID: <20190608211318.GC2359@xo-6d-61-c0.localdomain>
References: <20190608121312.11056-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190608121312.11056-1-oleg@kaa.org.ua>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat 2019-06-08 15:13:11, Oleh Kravchenko wrote:
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  drivers/leds/leds-cr0014114.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
> index 0e4262462cb9..91deb40db307 100644
> --- a/drivers/leds/leds-cr0014114.c
> +++ b/drivers/leds/leds-cr0014114.c
> @@ -37,7 +37,7 @@
>  
>  /* CR0014114 default settings */
>  #define CR_MAX_BRIGHTNESS	GENMASK(6, 0)
> -#define CR_FW_DELAY_MSEC	10
> +#define CR_FW_DELAY_USEC	10000
>  #define CR_RECOUNT_DELAY	(HZ * 3600)
>  
>  struct cr0014114_led {
> @@ -92,7 +92,7 @@ static int cr0014114_recount(struct cr0014114 *priv)
>  
>  	cmd = CR_NEXT_REENUMERATE;
>  	for (i = 0; i < priv->count; i++) {
> -		msleep(CR_FW_DELAY_MSEC);
> +		usleep_range(CR_FW_DELAY_USEC, CR_FW_DELAY_USEC + 1);
>  
>  		ret = spi_write(priv->spi, &cmd, sizeof(cmd));

Is added precision actually needed/benefical here?

									Pavel
