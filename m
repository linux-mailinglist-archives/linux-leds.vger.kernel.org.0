Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20842780A5F
	for <lists+linux-leds@lfdr.de>; Fri, 18 Aug 2023 12:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238601AbjHRKmf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Aug 2023 06:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376266AbjHRKmV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Aug 2023 06:42:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F179B13E
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 03:42:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 881D264C40
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 10:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD06C433C8;
        Fri, 18 Aug 2023 10:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692355339;
        bh=1Yw7OTlPPxOuSR9Q4He2A6LTB8qpe26jb0AgMxQeb9g=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=vL4woRUO0EYODnBm848OwI/ne5t+bZ1ME/ZWIma3Ms37upc/ObvZBKO9Dxokr4tzZ
         1Tl0mvgIgM7ZqBiBYYsvwW2SzwgAU/fpX7hpzwneWlLkxFB7vfWK6XX35x8vGlYsVp
         pAcJiF/XCF7zecbsQFlv5MJeUdOwF0Pweiauu0vAH60vGEkcHOCy6Rh635BXNMNDks
         egVNn+9XhWD3ulQXc/dpYQWgRT3T/HPhK/AaELE9qhR9ExhX/LzaM/q29bYowu6xaR
         oT+UDugUSsnqRy3NTG2D5XhMdBDjE7Bk+M3GvBPeMvPvQmCKwYf/VQdqQDVmDEflvi
         uRQQmqN2V6nrQ==
From:   Lee Jones <lee@kernel.org>
To:     pavel@ucw.cz, lee@kernel.org, andrew@lunn.ch, ansuelsmth@gmail.com,
        davem@davemloft.net, kuba@kernel.org, dan.carpenter@linaro.org,
        Li Zetao <lizetao1@huawei.com>
Cc:     yang.lee@linux.alibaba.com, linux-leds@vger.kernel.org
In-Reply-To: <20230815075944.1089298-2-lizetao1@huawei.com>
References: <20230815075944.1089298-1-lizetao1@huawei.com>
 <20230815075944.1089298-2-lizetao1@huawei.com>
Subject: Re: (subset) [PATCH -next 1/2] leds: trigger: netdev: Use
 module_led_trigger macro to simplify the code
Message-Id: <169235533685.1247426.17850934051203206321.b4-ty@kernel.org>
Date:   Fri, 18 Aug 2023 11:42:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 15 Aug 2023 15:59:43 +0800, Li Zetao wrote:
> Use the module_led_trigger macro to simplify the code, which is the
> same as declaring with module_init() and module_exit().
> 
> 

Applied, thanks!

[1/2] leds: trigger: netdev: Use module_led_trigger macro to simplify the code
      commit: 74cd23e87d7b5ebd5185d3930a7d95fbd859a256

--
Lee Jones [李琼斯]

