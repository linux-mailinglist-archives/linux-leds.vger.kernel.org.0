Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 235B6766805
	for <lists+linux-leds@lfdr.de>; Fri, 28 Jul 2023 11:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235078AbjG1JAf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Jul 2023 05:00:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234723AbjG1JA1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Jul 2023 05:00:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39DCA135
        for <linux-leds@vger.kernel.org>; Fri, 28 Jul 2023 02:00:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B801F62068
        for <linux-leds@vger.kernel.org>; Fri, 28 Jul 2023 09:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36A1C433C8;
        Fri, 28 Jul 2023 09:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690534825;
        bh=1lYwMG8tcUPd3CRMZHjV4cT6HxYI/lmf1nkvet186Mc=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=BIGf8eymExzrr+zMvH2dt7D83rkngnic5UuwSwTb1jshf4TuFV9KXQ41dhmby0Vmf
         xf802qBkAxdx7U9hNs2MRlvqmsTuthx/P/KqKi8w+O5u0Fkh9uoviGD740hn0wfLqX
         afRiPdiXekv5QLIg7WUPdd9CA5c0Tb48JEMIJP7hV6fGL4kZ9Rf5y9VASKplWxjRdG
         MAg0aXAbHv5SxBQzRfXzX5DMojhxARJBQkNQFY2yQkGgJQDCxANpbEa8JZabplUTUS
         H0PJL49czCSjY/2TXENmq0BBAra7ug0OWQznmPlgla0bYzkV1Au+z7hN3qyP9GgAsf
         tU7ZX70I/L4SQ==
From:   Lee Jones <lee@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        William Zhang <william.zhang@broadcom.com>,
        linux-leds@vger.kernel.org,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20230714063214.3791-1-zajec5@gmail.com>
References: <20230714063214.3791-1-zajec5@gmail.com>
Subject: Re: (subset) [PATCH] leds: bcm63138: rename dependency symbol
 ARCH_BCM4908 to ARCH_BCMBCA
Message-Id: <169053482332.288972.7616760504229777665.b4-ty@kernel.org>
Date:   Fri, 28 Jul 2023 10:00:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 14 Jul 2023 08:32:14 +0200, Rafał Miłecki wrote:
> Symbol ARCH_BCM4908 has been merged/removed without updating leds
> Kconfig.
> 
> 

Applied, thanks!

[1/1] leds: bcm63138: rename dependency symbol ARCH_BCM4908 to ARCH_BCMBCA
      commit: 3c19c79146e1522f52918a5d335523e48f669a1b

--
Lee Jones [李琼斯]

