Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0345272F128
	for <lists+linux-leds@lfdr.de>; Wed, 14 Jun 2023 02:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbjFNAwH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 13 Jun 2023 20:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjFNAwG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 13 Jun 2023 20:52:06 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B11AF198D;
        Tue, 13 Jun 2023 17:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=m81/mtRzPNxBmTZ8Ug6NdeknJttcACMBx0HZCk1Hkgo=; b=p5G2THXg3xa8nntRnhKlwoMbZX
        Mv87KPbErYJueTmkXbxD2FGYcxY+G6PXZnN4rjSu3CkN1ZU6qV1Wtv6jyPaiVRSP4ipqR5WioPwWG
        DoLsSpkorqejlBT8+UlvdrZ5MlNkO/9W/wBJjG/NhSfUYNGkG6Cx73q/PwXNZsQ4bivc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q9Ejv-00Fsaa-5j; Wed, 14 Jun 2023 02:51:59 +0200
Date:   Wed, 14 Jun 2023 02:51:59 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Christian Marangi <ansuelsmth@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v2 led] leds: trigger: netdev: uninitialized variable in
 netdev_trig_activate()
Message-ID: <83344fe7-6d95-44d8-8ce7-13409c7a8d87@lunn.ch>
References: <6fbb3819-a348-4cc3-a1d0-951ca1c380d6@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fbb3819-a348-4cc3-a1d0-951ca1c380d6@moroto.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Jun 13, 2023 at 09:46:53AM +0300, Dan Carpenter wrote:
> The qca8k_cled_hw_control_get() function which implements ->hw_control_get
> sets the appropriate bits but does not clear them.  This leads to an
> uninitialized variable bug.  Fix this by setting mode to zero at the
> start.
> 
> Fixes: e0256648c831 ("net: dsa: qca8k: implement hw_control ops")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: In the original patch I fixed qca8k_cled_hw_control_get() instead
> so that patch went to netdev instead of to the led subsystem.

I think his actually needs to be merged via netdev.  e0256648c831
("net: dsa: qca8k: implement hw_control ops") is in net-next/main.  I
don't see it in leds/master, leds/for-leds-next. Also, git blame shows
mode was added by 0316cc5629d1 ("leds: trigger: netdev: init mode if
hw control already active") which also appears only to be in
net-next/main.

A lot of these LED patches were merged via netdev because they are
cross subsystem.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
