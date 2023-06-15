Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6BB7315C3
	for <lists+linux-leds@lfdr.de>; Thu, 15 Jun 2023 12:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245692AbjFOKu1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 15 Jun 2023 06:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245643AbjFOKuY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Jun 2023 06:50:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4969F2119;
        Thu, 15 Jun 2023 03:50:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 816A5637CE;
        Thu, 15 Jun 2023 10:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DED0DC433A9;
        Thu, 15 Jun 2023 10:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686826220;
        bh=LEwkqHixw0z0OGcrNEwNOb/Nt8oETkR9AizJXI9T9WQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=JI2TzUnz5SdfTzjKhtSNRAAyLJQsuOzh6e3wCpGAXEAtA2cx6ttqoTWlmhGsLhSYZ
         QuAV+0FFdkkCe/fSNIg4FproybbjCMbQ98KF+3350iyyUZnspFq9NDa/6McKJgB9Jq
         9Mrms2cfPhYtTDYaBHZdiLbtG9SRUmeB+K4dbdf1C0mMG0GyYrMy99l8fAbZ434QBh
         wtI6GnV3O3adz83slsyCd5JMgdSkQBS7pZd0bO5R8+F//xykCEN/58lHDFJW3aAXLH
         0TbkHLmCDq1NxDngQS/COh0w+ZIVoDHp7baN86KFsLEIkwewv55Tsty0Krm7BRY/JW
         YmXnq5rq9JhXA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CA7FFC395C7;
        Thu, 15 Jun 2023 10:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next resend] leds: trigger: netdev: uninitialized
 variable in netdev_trig_activate()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168682622082.15431.1307423348951437453.git-patchwork-notify@kernel.org>
Date:   Thu, 15 Jun 2023 10:50:20 +0000
References: <ZIlmX/ClDXwxQncL@kadam>
In-Reply-To: <ZIlmX/ClDXwxQncL@kadam>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     ansuelsmth@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        pavel@ucw.cz, netdev@vger.kernel.org, lee@kernel.org,
        andrew@lunn.ch, davem@davemloft.net, linux-leds@vger.kernel.org,
        kernel-janitors@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed, 14 Jun 2023 10:03:59 +0300 you wrote:
> The qca8k_cled_hw_control_get() function which implements ->hw_control_get
> sets the appropriate bits but does not clear them.  This leads to an
> uninitialized variable bug.  Fix this by setting mode to zero at the
> start.
> 
> Fixes: e0256648c831 ("net: dsa: qca8k: implement hw_control ops")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
> [...]

Here is the summary with links:
  - [v2,net-next,resend] leds: trigger: netdev: uninitialized variable in netdev_trig_activate()
    https://git.kernel.org/netdev/net-next/c/97c5209b3d37

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


