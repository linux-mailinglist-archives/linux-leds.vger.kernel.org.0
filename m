Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A984B77CD49
	for <lists+linux-leds@lfdr.de>; Tue, 15 Aug 2023 15:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237408AbjHONTo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Aug 2023 09:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237414AbjHONTP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Aug 2023 09:19:15 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32BDF1999
        for <linux-leds@vger.kernel.org>; Tue, 15 Aug 2023 06:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=1ZjaZWBKtx07zDSH1ktfhzpojEet0Nz1UN0nmm5eNCg=; b=SCgH+6mc3mWd5gTL1yMoUzhC1C
        k9pyyD90gXVY77ew+YtAhdrIf4S9dVpyAEbHFVyzyI5H8dR/oNT4f+Bpw38WGNjze3ehgS0XGoa3u
        2hOnZRLQcUUSkQzUPwSZXJGKA4YHm8lnpAIvq7b9MC9+i9q6RfPxtcKihYKwVz+wNmhY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qVtwt-0049t0-IW; Tue, 15 Aug 2023 15:19:03 +0200
Date:   Tue, 15 Aug 2023 15:19:03 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Li Zetao <lizetao1@huawei.com>
Cc:     pavel@ucw.cz, lee@kernel.org, ansuelsmth@gmail.com,
        davem@davemloft.net, kuba@kernel.org, dan.carpenter@linaro.org,
        yang.lee@linux.alibaba.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH -next 1/2] leds: trigger: netdev: Use module_led_trigger
 macro to simplify the code
Message-ID: <5e0b97f0-a078-48be-8316-cdb5878678d1@lunn.ch>
References: <20230815075944.1089298-1-lizetao1@huawei.com>
 <20230815075944.1089298-2-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815075944.1089298-2-lizetao1@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Aug 15, 2023 at 03:59:43PM +0800, Li Zetao wrote:
> Use the module_led_trigger macro to simplify the code, which is the
> same as declaring with module_init() and module_exit().
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
