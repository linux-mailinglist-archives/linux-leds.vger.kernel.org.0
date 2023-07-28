Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D027666E8
	for <lists+linux-leds@lfdr.de>; Fri, 28 Jul 2023 10:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234884AbjG1IWz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Jul 2023 04:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234889AbjG1IWK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Jul 2023 04:22:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982D64481;
        Fri, 28 Jul 2023 01:21:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 18EFA62045;
        Fri, 28 Jul 2023 08:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B13EC433C7;
        Fri, 28 Jul 2023 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690532462;
        bh=DMwg3U7ETlMhkrGihrRA6J3whW7gP30wrKzTnlGxfMA=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=ksZ0cEC1AwwxW16hKBfcM2zgE5yzCsDVhYvKuCr/sdzyj8yw7t8FPbG0NUsx06FJm
         nHkgSkXJMNR3c+BNKObvkJGFVc0XZiLAS5UAMvjHLVe+bWMu/Ei+VknN0I70fi5iww
         vLc9RiQIAO3CbJFKNYLdEbXVlsVsJP99X6gXzfA5RsBVxAfVxsE45FS3Pw7cEVsQCX
         aQfOYbn4QkHqG46PJqjvh6jUrDHel6Jp3zXNrv/MJGNoqjQzyBAB9NTpps+C+JtKEp
         n3DxePRUEIOW8Tz0/WrG5qiNZ0eIMk8SFzYMCiR3CAxRiNwfBKNqiMU3EGSKDTZ9o0
         w41AORsEkB0LA==
From:   Lee Jones <lee@kernel.org>
To:     linux-leds@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc:     Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20230713163516.21644-1-marex@denx.de>
References: <20230713163516.21644-1-marex@denx.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: leds: pca995x: Add binding
 document for PCA995X chips
Message-Id: <169053245996.271756.12831657035182461894.b4-ty@kernel.org>
Date:   Fri, 28 Jul 2023 09:20:59 +0100
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

On Thu, 13 Jul 2023 18:35:15 +0200, Marek Vasut wrote:
> The PCA995x chips are I2C controlled LED drivers. Each chip has
> up to 16 outputs, each one with an individual 8-bit resolution
> PWM for brightness control. Add binding document.
> 
> 

Applied, thanks!

[1/2] dt-bindings: leds: pca995x: Add binding document for PCA995X chips
      commit: b851af1c064e65b49283945937ece5d93fadbdfa
[2/2] leds: pca995x: Add support for PCA995X chips
      commit: 6863b75a930513af1854f378f0a6a3a6a60fe8f9

--
Lee Jones [李琼斯]

