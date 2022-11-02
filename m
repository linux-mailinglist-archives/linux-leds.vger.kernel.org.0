Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 934FF61567D
	for <lists+linux-leds@lfdr.de>; Wed,  2 Nov 2022 01:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiKBAXS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Nov 2022 20:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbiKBAXS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Nov 2022 20:23:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 814B31408D
        for <linux-leds@vger.kernel.org>; Tue,  1 Nov 2022 17:23:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 19343B8203E
        for <linux-leds@vger.kernel.org>; Wed,  2 Nov 2022 00:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D34C433C1;
        Wed,  2 Nov 2022 00:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667348594;
        bh=kSWpDalP3Oth5TGkiPBUlsH14vOEyac8fstEVPFK1Rg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jub216nJktOnr7RN53Jx7ZxdBvsm681kQra25IoFfNYPgPDiyUQwwGZsKUHL5QWnk
         bN3xaW23RvbV9NsTK1ichicFVqL1WGK7awD9BRa+q8/a4BlDKlZKcCcJiITp6zj5Rq
         8zzphVgEoYWEK9QyLwwatXJ6dZBefQpk827a6F3oEl2zIsGZiYElaDJOFyTT79HSdT
         i//b3TLQlnCuisoRZkXWaMK4sHmM3/gD1AQd1PrezgzKgSJr8NTAD4ZUJcI73oboHI
         YRVAZXp2qT/dmO84ElZslnNfTZcRkpsp874tPLjxvFbO51sloTToFMRFStIKMuanNS
         J8gK4IuNmvBTw==
Received: by pali.im (Postfix)
        id C708F7F8; Wed,  2 Nov 2022 01:23:11 +0100 (CET)
Date:   Wed, 2 Nov 2022 01:23:11 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        Josef Schlehofer <josef.schlehofer@nic.cz>
Subject: Re: [PATCH 0/3] leds: turris-omnia: updates
Message-ID: <20221102002311.twso5wb4tzba5h2k@pali>
References: <20220704105955.15474-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220704105955.15474-1-kabel@kernel.org>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Ping? Gentle reminder.

On Monday 04 July 2022 12:59:52 Marek Behún wrote:
> Hello Pavel,
> 
> the upstream leds-turris-omnia driver is disabled in upstream Omnia
> device-tree and isn't used by TurrisOS because it does not support
> enabling HW control. This is because I wanted to implement it via
> netdev trigger transparent offloading, but I still wasn't able to
> implement this satisfactorily (and truthfully haven't had much time
> to look into this for almost half a year now).
> 
> Let's implement this in the meantime via the private trigger
> mechanism that we added two years ago.
> 
> In the future if netdev offloading gets implemented, we can still
> keep this implementation if backwards compatibility is desired, or
> we can just drop it.
> 
> Marek
> 
> Marek Behún (3):
>   leds: turris-omnia: support HW controlled mode via private trigger
>   leds: turris-omnia: initialize multi-intensity to full
>   leds: turris-omnia: change max brightness from 255 to 1
> 
>  drivers/leds/Kconfig             |  1 +
>  drivers/leds/leds-turris-omnia.c | 46 +++++++++++++++++++++++++++++++-
>  2 files changed, 46 insertions(+), 1 deletion(-)
> 
> -- 
> 2.35.1
> 
