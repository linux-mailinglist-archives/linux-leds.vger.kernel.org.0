Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA42240301
	for <lists+linux-leds@lfdr.de>; Mon, 10 Aug 2020 09:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgHJHxZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Aug 2020 03:53:25 -0400
Received: from mout.gmx.net ([212.227.15.15]:50997 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgHJHxY (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 Aug 2020 03:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1597046002;
        bh=BGHmVmfzxxMHSYOMNFzjJTk9r5x5nYy5OZvRCZMmU4k=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=IliGgpwaIVYKWcZ9vN6orqAjP1GTVBvCB1ybG1oAK3ZpXISi5+E7ky6v1B8fHvqt0
         ABcAkXRine2eRjNcNEO8SOpUaaRToYqdcan8YSCu7b0DIY3aAWxHCCV8n0AF0dWnUW
         9yZjJA7OmXXkkioiIDdA6H3ltTCrp+hX7EtcreWc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [188.192.120.146] ([188.192.120.146]) by web-mail.gmx.net
 (3c-app-gmx-bs28.server.lan [172.19.170.80]) (via HTTP); Mon, 10 Aug 2020
 09:53:22 +0200
MIME-Version: 1.0
Message-ID: <trinity-17812215-fb10-4c73-b0d7-47c2235386a7-1597046002173@3c-app-gmx-bs28>
From:   truart@gmx.de
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org
Subject: Aw: Re: led block trigger patch
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 10 Aug 2020 09:53:22 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200810073359.GA15023@amd>
References: <trinity-ff7f1644-b76d-424b-9a6f-8caaf9961ffe-1595962052162@3c-app-gmx-bap12>
 <50db75e2-d53c-ce8b-bd00-1099be0e2e74@ifi.lmu.de>
 <trinity-bc8857f4-cee1-4b95-a4fd-cc817119a95c-1597042087357@3c-app-gmx-bap76>
 <20200810073359.GA15023@amd>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:IQpL7K0Cy+IpSf2MfT76vbmeU3k6fxRtmW/H/1G//1Sn7fC9kpJYcfH4+mxeLCqtBok+F
 pwoSrBY2YXHjzt3UnCR/VmZqYefHEWiSgMZv8AUW2bK37DZ5lXmcX0yoWXhzLqS+9cpSXgBJEg7x
 z4DmLIvtyMKURhHU3SQ8xFahaAO1DW/dUWoE3PSr8EYiEH60Z3oU4dcQoTRe/Z+apQfz3fbG/Teb
 a2ow94JmR2V+D7+ODf4aKip1qoGJprHcCIhIWp1ZlyyqddVDgum6iWjDJwSPF7f6uHT3Tuj+B7xI
 mw=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lNssb8FWNuU=:4VhzewpptawWaQvEVm8Dt0
 lPuFfI04e9GQD2HSzzTXHgkbgwNnSU8Ssv9XGU9Mz2BoEOdpqaYHtDX87k191hizL+YwHgk/Q
 1/nGmJ63+7Sw/h1RrkdT5dOw5qguX5iK51puyr/MJNuxP5FOjzv5J1DkiVb0kGJqcIehz4+te
 5jYomJ4p6dAWNy4Ba+02vKXM7SqXHLwLxFXVMWfmL/DtJ84mpyy7qwd+Wh3h/pEZgbcRGUQJJ
 QTHFbsSS8DRMrK0z1nfX8Iedcx2rhwN8tHNPOMBYkE1DwvQGLpTSbHNO+VLPi55eXhfFh0tX6
 TV40eju560J0aDSgFdKwVsSTRCxTIXlNX551BadgWXC3U5Bly44D6Ywiq1Np3eo+zLaLTxIzE
 Fdklsar5YFlo9XH1Whp0CEgAsBzhvgpYkgz+1naiRAvfola0Stpv8YcIBpsr7L60ZpKMdOWKK
 WqwXFG4chikg4/sYkXPMRCh5A4blShjKtoU367fX6y47AmcCz4mxEhU09/4C97WKVPN43iGll
 ZIhd35Mxh1GtaLyQVtuiUuODaxJNB/QWd3ZYOXZAr/FQOWgiVo1qeo5y2gx0vjOH8bQCwmzJH
 dOniCRPPp/OwszZEPPsFZUost9TCyx9esY74U75bBcx+PqxI86BMjJJzrh7eZF4GbklPOZjW2
 7ExZzQY75AZw8zhMyMejhKLQ0DfMuboytmHak0wKmwJnxwA==
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

> What was the point of me reviewing the old patch when you are not
> going to fix it? That was not very constructive.

I'm sorry :( I really didn't mean to cause unneccessary work for anyone!
Michael
