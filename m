Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5B5451B956
	for <lists+linux-leds@lfdr.de>; Thu,  5 May 2022 09:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbiEEHpV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 May 2022 03:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345513AbiEEHpU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 May 2022 03:45:20 -0400
X-Greylist: delayed 2128 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 05 May 2022 00:41:41 PDT
Received: from ao2.it (mail.ao2.it [92.243.12.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDBF1C901;
        Thu,  5 May 2022 00:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ao2.it; s=20180927;
        h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date; bh=lond+a4bCQAxVhPAjkVW6lgP11E9zMPB6gW9cqz7d/E=;
        b=l8zf/DF4MpbmMcJgRI2PTtuY8nJaaecd/L0lmGc9YmBZLvnI0bVSPdKQvqOaTVVGXCL3zXjyh03H7yCXfw9EK0LCRSR7exIkKoCaFXhPLMU/nYUy2kYQudwVS6rpqUquwqABeOGvTy4ewkm9v0Mn5RtKjsw/MsiXTMNxkUqVQaJI4T08OOLag+4VJDRSyhfjG34upId10X7/0GSqMiqqGoIBc0T3Trnybc0KTyeqK9BXmLHDpgAZ143kljb1/SBi/dRLnEu0mGWs9zu2jf9F7mZ+JEcExi9Q5xRSGVj0cnz5sFWFsYai4d7fkvjogwBR2UBCZKEkd++d9JUq8aXViw==;
Received: from localhost ([127.0.0.1] helo=jcn.localdomain)
        by ao2.it with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.84_2)
        (envelope-from <ao2@ao2.it>)
        id 1nmVYP-0001vx-Py; Thu, 05 May 2022 09:05:37 +0200
Date:   Thu, 5 May 2022 09:06:03 +0200
From:   Antonio Ospite <ao2@ao2.it>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: leds: Add regulator-led binding
Message-Id: <20220505090603.a9b902a2c9e51088c932a164@ao2.it>
In-Reply-To: <20220504174229.GC8725@duo.ucw.cz>
References: <20220404203522.2068071-1-linus.walleij@linaro.org>
        <20220504174229.GC8725@duo.ucw.cz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H;1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;]yA5<GWI5`6u&+
 ;6b'@y|8w"wB;4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG !pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 4 May 2022 19:42:29 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> On Mon 2022-04-04 22:35:20, Linus Walleij wrote:
> > The regulator is a LED connected directly to a regulator and with
> > its brightness controlled by the voltage of the regulator.
> 
> Thank you, applied.
> 

Thank you all for keeping this driver up to date :)

Ciao,
   Antonio

-- 
Antonio Ospite
https://ao2.it
https://twitter.com/ao2it

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
