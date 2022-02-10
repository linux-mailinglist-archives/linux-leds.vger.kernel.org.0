Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE7F4B08A4
	for <lists+linux-leds@lfdr.de>; Thu, 10 Feb 2022 09:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237741AbiBJIlx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Feb 2022 03:41:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237627AbiBJIlw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Feb 2022 03:41:52 -0500
X-Greylist: delayed 365 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Feb 2022 00:41:54 PST
Received: from mail.trixen.pl (mail.trixen.pl [192.71.213.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3906B108D
        for <linux-leds@vger.kernel.org>; Thu, 10 Feb 2022 00:41:54 -0800 (PST)
Received: by mail.trixen.pl (Postfix, from userid 1001)
        id BA25340A1B; Thu, 10 Feb 2022 09:35:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trixen.pl; s=mail;
        t=1644482147; bh=J50dbWEn9x62xyxY1PWPtYxMwNMcDFoILqXfzM3his0=;
        h=Date:From:To:Subject:From;
        b=lWl3P6fh38Vj28ZlVc46uv0l1R4Our4qlI7DBf2AixuzLcJyqyH7rIRgmapyPYyph
         YtKyDx1k62ZUPahuDRAVfxjj4lhX5p+/OAMrptTHqHFJtBI43HP+Ny5Zr/zo/hGLNn
         trEHhpqvpy4/FghqaiO1wAXKDy3AEPmIrMfyY2F3gLH2mkDKTTkKXri0kOvm6vFgSW
         2Rsu7oF457XFwbB1cyHHni0olPhyn1w6ocfNp5+QBbwnVftg0ad8KX2eCf4uM90IvX
         DlI6B2ZBQBB5qpO69cU90lBuiILML3St9SbPUY0J/Dx29Gqrl71q12bhCEFum5bsh1
         XcU2Wk1SV91xA==
Received: by mail.trixen.pl for <linux-leds@vger.kernel.org>; Thu, 10 Feb 2022 08:35:44 GMT
Message-ID: <20220210084500-0.1.t.1t3k.0.sjylhkp1ld@trixen.pl>
Date:   Thu, 10 Feb 2022 08:35:44 GMT
From:   =?UTF-8?Q? "Rados=C5=82aw_Grabowski" ?= 
        <radoslaw.grabowski@trixen.pl>
To:     <linux-leds@vger.kernel.org>
Subject: Monitorowanie samochodu
X-Mailer: mail.trixen.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dzie=C5=84 dobry,

Chcia=C5=82bym przedstawi=C4=87 rozwi=C4=85zanie, kt=C3=B3re poprzez wyko=
rzystanie GPS monitoruje samochody w czasie rzeczywistym.=20

Dzi=C4=99ki temu mog=C4=85 Pa=C5=84stwo odczytywa=C4=87 wszelkie warto=C5=
=9Bci dotycz=C4=85ce np. zu=C5=BCycia paliwa czy obrot=C3=B3w silnika.

System automatycznie generuje rozbudowane raporty i pozwala dokonywa=C4=87=
 istotnych analiz.

Je=C5=BCeli interesuje Pa=C5=84stwa zwi=C4=99kszenie wydajno=C5=9Bci prac=
y i kontrola wszelkich parametr=C3=B3w floty - prosz=C4=99 o kontakt.


Pozdrawiam,
Rados=C5=82aw Grabowski
