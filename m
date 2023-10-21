Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59AA37D1E3E
	for <lists+linux-leds@lfdr.de>; Sat, 21 Oct 2023 18:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbjJUQ2z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Oct 2023 12:28:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbjJUQ2y (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Oct 2023 12:28:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D754F106;
        Sat, 21 Oct 2023 09:28:49 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775D7C433C8;
        Sat, 21 Oct 2023 16:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1697905727;
        bh=VjbjoB+vbGx+egXMLwVw1EQb/Pg3ogPkAciDz+i5XVU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M0MHZcsifQNktVBDmc/wfsq+a0/EqXJZNzmLlCYjisqQpiN6qlsgIkOoeRTnH5MVC
         dIuCD4gwl2jnbLpt4VeZ65Otj3aODBJ3ArRRDWWeKqUSn/Y6VjXO2xFaw8rPyZyqoH
         TUc+MGyL5YBCns5DvVgvjm+goiPKovaez8ut0Tik=
Date:   Sat, 21 Oct 2023 18:28:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Florian Eckert <fe@dev.tdt.de>
Cc:     Eckert.Florian@googlemail.com, jirislaby@kernel.org, pavel@ucw.cz,
        lee@kernel.org, kabel@kernel.org, u.kleine-koenig@pengutronix.de,
        ansuelsmth@gmail.com, m.brock@vanmierlo.com,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 1/3] tty: whitespaces in descriptions corrected by
 replacing tabs with spaces
Message-ID: <2023102110-starlight-wispy-1f28@gregkh>
References: <20231019112809.881730-1-fe@dev.tdt.de>
 <20231019112809.881730-2-fe@dev.tdt.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019112809.881730-2-fe@dev.tdt.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Oct 19, 2023 at 01:28:07PM +0200, Florian Eckert wrote:
> Tabs were used in the function description, to make this look more
> uniform, the tabs were replaced by spaces where necessary.
> 
> While we're at it, I also replaced the 'ndashes' with simple dashes, since
> only those are supported by sphinx.
> 
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> ---
>  drivers/tty/tty_io.c | 102 +++++++++++++++++++++----------------------
>  1 file changed, 51 insertions(+), 51 deletions(-)

This didn't apply cleanly as portions of this patch were already in my
tree, what did tree did you make it against?

Anyway, I've fixed it up and taken it now.

thanks,

greg k-h
