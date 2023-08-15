Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0F977D105
	for <lists+linux-leds@lfdr.de>; Tue, 15 Aug 2023 19:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238850AbjHORau (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Aug 2023 13:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238887AbjHORaf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Aug 2023 13:30:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31BF41BD8;
        Tue, 15 Aug 2023 10:30:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BA9116165D;
        Tue, 15 Aug 2023 17:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64025C433C7;
        Tue, 15 Aug 2023 17:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692120633;
        bh=WT7lqYYbdnO4EQaTflZ5JYKuu+SrEFSusULuRq8He1I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PNo8IYa5Pi25Df4UPmxhVnagL6F7Pg/oui7goNBJXi+lGnMPxjMW4lRUDzPH/xyYI
         wI5t//FUqvKDDS9r2tOdC/duh4rU7QMYE1gNLu6+k2XaUKsG9p5tFZm+Eo7EymNR+1
         aT93AGIsohFgsVIBk3I3cPhHj9GLansOjbz8ZTcSR9g0ioaV7/ExUQ4AIJXPrTkNKh
         q6ayNVSZitoLpRB8JGMhs9TclNViO5HiR42Zbgej0mUBti8VApR2DM2HJRDGYZrMXK
         Y+mTNLLecgHYPJ7nION0Rq9fHyd4z+U1IOZUJoSBfh0sGwWq+MNqMHNPDDNpi66lMe
         E1hMuEuzTJAKA==
Date:   Tue, 15 Aug 2023 18:30:28 +0100
From:   Lee Jones <lee@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-leds@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] leds: pca995x: Fix MODULE_DEVICE_TABLE for OF
Message-ID: <20230815173028.GE648357@google.com>
References: <20230809125314.531806-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230809125314.531806-1-marex@denx.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 09 Aug 2023, Marek Vasut wrote:

> Fix copy-paste error in MODULE_DEVICE_TABLE() for the OF table,
> use the 'of' first parameter instead of duplicate 'i2c'.
> 
> Fixes: ee4e80b2962e ("leds: pca995x: Add support for PCA995X chips")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Isai Gaspar <isaiezequiel.gaspar@nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> ---
> NOTE: This should be added on top of leds-lj or squashed into the driver patch
> ---
>  drivers/leds/leds-pca995x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
