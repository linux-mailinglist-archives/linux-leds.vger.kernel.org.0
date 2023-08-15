Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4FB377CD46
	for <lists+linux-leds@lfdr.de>; Tue, 15 Aug 2023 15:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233395AbjHONSj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Aug 2023 09:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237429AbjHONS0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Aug 2023 09:18:26 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 499ABE7A
        for <linux-leds@vger.kernel.org>; Tue, 15 Aug 2023 06:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=IVIgVAaEiynVFDb7tHbEp6vZgKISEnHGMrzX2Eh2Eu4=; b=Piowmh+rj5ajjuvvIYnVys68xY
        Xlwfp/i0WHwsABSXoJ7R4I40N3jFxLuwjfGu6defanSVW8qh0R+QrER/chPoEX79rBAqPLl0JloFc
        kxBPSXEv1bDRXS6O79DmQtrUaI1hDNZuiZxCT0htPCjC5zYCQU2Ryu/4/G5yYeKH8pd0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qVtvn-0049sU-Dw; Tue, 15 Aug 2023 15:17:55 +0200
Date:   Tue, 15 Aug 2023 15:17:55 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Li Zetao <lizetao1@huawei.com>
Cc:     pavel@ucw.cz, lee@kernel.org, ansuelsmth@gmail.com,
        davem@davemloft.net, kuba@kernel.org, dan.carpenter@linaro.org,
        yang.lee@linux.alibaba.com, linux-leds@vger.kernel.org
Subject: Re: [PATCH -next 0/2] Simplify the code with declaration-driven
 macros
Message-ID: <3ac35f8c-aedc-4ea9-afc0-5c39711bbc29@lunn.ch>
References: <20230815075944.1089298-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815075944.1089298-1-lizetao1@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Aug 15, 2023 at 03:59:42PM +0800, Li Zetao wrote:
> The patch set uses the declaration-driven macros to simplify the code.

Hi Li

After reading this description, i had no idea what the patches were
going to do. Subjects and descriptions are important, they help get
the right people to read your patch. So please try to improve them.

    Andrew
