Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF6A2A107D
	for <lists+linux-leds@lfdr.de>; Fri, 30 Oct 2020 22:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbgJ3VrF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Oct 2020 17:47:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:49160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725806AbgJ3VrF (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 30 Oct 2020 17:47:05 -0400
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4DEBC20727;
        Fri, 30 Oct 2020 21:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604094424;
        bh=Xd803DnDFz9dSwNoUI8Jd+509VrpwNx+7kXNhreY5Eo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QrZCgb0sdmMT/TJ5OtKB3WSSyLLv+jZH/2/5hIoUOnInB++rRsytOLKOYKgwAinos
         74ffoOaBMNh1AaB7mux0cNUHYM2ixkQCPTyT+oOb7XAVOYwHam2rWxlkIxMfa8bm3Q
         RpOaCzr9eQFGnb+s6KSFoQGl47qYk2yZXAfLQ2iE=
Date:   Fri, 30 Oct 2020 22:46:52 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
        <devicetree@vger.kernel.org>, <robh+dt@kernel.org>
Subject: Re: [PATCH leds 4/5] dt-bindings: leds: leds-class-multicolor: use
 LED_COLOR_ID_RGB for now
Message-ID: <20201030224652.6cd02941@kernel.org>
In-Reply-To: <b22f8d21-7625-dcff-616c-0c68008b5ab2@ti.com>
References: <20201030023906.24259-1-kabel@kernel.org>
        <20201030023906.24259-4-kabel@kernel.org>
        <b22f8d21-7625-dcff-616c-0c68008b5ab2@ti.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 30 Oct 2020 08:08:01 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> Why are you resubmitting the multicolor.yaml?
> 
> https://lore.kernel.org/patchwork/patch/1320863/
> 
> This is waiting on DT review.
> 
> Dan
> 

I must have overlooked that patch, sorry.
