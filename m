Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A36116BD11B
	for <lists+linux-leds@lfdr.de>; Thu, 16 Mar 2023 14:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbjCPNlX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Mar 2023 09:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbjCPNlW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Mar 2023 09:41:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61A0C2D8A;
        Thu, 16 Mar 2023 06:41:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 78032B82181;
        Thu, 16 Mar 2023 13:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D2DC4339E;
        Thu, 16 Mar 2023 13:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678974071;
        bh=UoWgFGxsRnsnVe4rYV63fJUjTvJZMyz5VdmFkUdrVyk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MXXLnDu24MnGfaRpzzthO5wmZnQ+yQNTBdA99S1VMebLTdMUGRYvQyT3cAUBavamD
         I9JX7MtksnVbBjQ52LzIM3JggMaTdTcEHNesvyEtT+zUr2j4Ls4ASpvRYY2HouYD0B
         bSdxhwcZFFsfW3kHDXlLXX8i82FdNCZictjpx2bHbggS8LiKibLo5aAlnXQ6Lls+Vw
         0ulzjBhICJlg+EtMB/7Dq4MuRjhbE8dy87r2rPkb78k+WvOL/xeFNxH16BWma4jgYR
         DXGM75sf5JyrPWu+pErsOkHPMELDR3elIUU4277Nap42ky/EMpcHpV5m4LXQNl7g7z
         zJGux/hYo56Jw==
Date:   Thu, 16 Mar 2023 13:41:06 +0000
From:   Lee Jones <lee@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] dt-bindings: leds: add "usbport" trigger
Message-ID: <20230316134106.GN9667@google.com>
References: <20230308065424.29113-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308065424.29113-1-zajec5@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 08 Mar 2023, Rafał Miłecki wrote:

> From: Rafał Miłecki <rafal@milecki.pl>
>
> Linux's "usbport" trigger is a bit specific one. It allows LED to follow
> state of multiple USB ports which have to be selected additionally
> (there isn't a single trigger for each port).
>
> Default list of USB ports to monitor can be specified using
> "trigger-sources" DT property. Theoretically it should be possible for
> Linux to deduce applicable trigger based on the references nodes in the
> "trigger-sources". It hasn't been implemented however (probably due to
> laziness).
>
> Milk spilled - we already have DT files specifying "usbport" manually -
> allow that value in the binding. This fixes validation of in-kernel and
> external DT files.
>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  Documentation/devicetree/bindings/leds/common.yaml | 1 +
>  1 file changed, 1 insertion(+)

Doesn't apply.  Please rebase onto -next.

Hint: Requires a line of documentation above the new property.

> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index 15e3f6645682..95b316ee3146 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -99,6 +99,7 @@ properties:
>            - pattern
>            - usb-gadget
>            - usb-host
> +          - usbport
>        - pattern: "^cpu[0-9]*$"
>        - pattern: "^hci[0-9]+-power$"
>          # LED is triggered by Bluetooth activity
> --
> 2.34.1
>

--
Lee Jones [李琼斯]
