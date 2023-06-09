Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 456DF729D02
	for <lists+linux-leds@lfdr.de>; Fri,  9 Jun 2023 16:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239211AbjFIOg7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 9 Jun 2023 10:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241359AbjFIOg6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 9 Jun 2023 10:36:58 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D2DE43;
        Fri,  9 Jun 2023 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=m3NdTkg/3DxRk6TFjsN9Xni0yRQdVPltZMic4MOLBFE=; b=u5ciJ4oA9gS4p532LXtDx1+Pp1
        DJEiCgOYRfujWkWwvxoJfauSb8A80bQq5Hw/DPlV1Um1XKt8z+ArlyMweXPkzRyhVzSakgk40onN+
        MgS6I66yK0PVsNtD85Pl1a80lSwgbxaSw/KvvmJlJxYKvU+9JO1ZdJP2SJ6ot3uVVIig=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q7dEO-00FLuH-PP; Fri, 09 Jun 2023 16:36:48 +0200
Date:   Fri, 9 Jun 2023 16:36:48 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] leds: trigger: netdev: add additional mode for
 unified tx/rx traffic
Message-ID: <20b33e91-1058-4ddd-9502-9b2018594e96@lunn.ch>
References: <20230609135103.14221-1-ansuelsmth@gmail.com>
 <20230609135103.14221-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609135103.14221-4-ansuelsmth@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Jun 09, 2023 at 03:51:03PM +0200, Christian Marangi wrote:
> Add additional mode for unified tx/rx traffic. LED will blink on both tx
> or rx traffic.
> 
> This is especially useful for PHY and Switch that supports LEDs hw
> control that doesn't support split tx/rx traffic but supports blinking
> on any kind of traffic in the link.
> 
> On mode set from sysfs we check if we have enabled split tx/rx mode and
> reject enabling activity mode to prevent wrong and redundant
> configuration.

TRIGGER_NETDEV_TX + TRIGGER_NETDEV_RX = TRIGGER_NETDEV_ACTIVITY:

When calling into the driver, it probably makes the drivers simpler if
you do this simplification. Within the trigger code, keep them
separate, because that is what the user has configured.

I know such a simplification will make the marvell PHY driver simpler.

	Andrew
