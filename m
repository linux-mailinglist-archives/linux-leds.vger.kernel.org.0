Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A93240216
	for <lists+linux-leds@lfdr.de>; Mon, 10 Aug 2020 08:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbgHJGsJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Aug 2020 02:48:09 -0400
Received: from mout.gmx.net ([212.227.17.21]:46095 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725846AbgHJGsJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 Aug 2020 02:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1597042087;
        bh=EBz7uFbBShn/t6hpEkJZFUUAfKapIq/pyW6d+fRO4go=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=DT3h38+3jVH/kVUq5f8JzjM4Id5CSsQ6L8ncJij+QWnl3ZXi7S0G7dcRu+biRTW7A
         KIVAn7h7rmHL+SK3h7930XzIYhSy4LwVCVn0LJhWBZS6+yQMZZE3MVsdl65HnHppO0
         gb1uBJtC2LpGhCwjvm/q9ng+mshLAjtiqKot6uik=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [188.192.120.146] ([188.192.120.146]) by web-mail.gmx.net
 (3c-app-gmx-bap76.server.lan [172.19.172.64]) (via HTTP); Mon, 10 Aug 2020
 08:48:07 +0200
MIME-Version: 1.0
Message-ID: <trinity-bc8857f4-cee1-4b95-a4fd-cc817119a95c-1597042087357@3c-app-gmx-bap76>
From:   truart@gmx.de
To:     linux-leds@vger.kernel.org
Subject: Re: led block trigger patch
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 10 Aug 2020 08:48:07 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <50db75e2-d53c-ce8b-bd00-1099be0e2e74@ifi.lmu.de>
References: <trinity-ff7f1644-b76d-424b-9a6f-8caaf9961ffe-1595962052162@3c-app-gmx-bap12>
 <50db75e2-d53c-ce8b-bd00-1099be0e2e74@ifi.lmu.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:tH7atJSCqoxPcKkTTrjt+slgIZibHqEpSnUKsUXC3IfXkpEKaGh9UFesAcVBQKlvAsIhC
 rVEfL4ZfOL9Qemc2y8d5y9jzSue4712/Ac3k2IKvyl8d70pNCQTHdhntQP9YO5H494iXpe0i6Anf
 WIxzZnL1d+bLRm8lXrpLLAJ7pQUCqbafb69JcCUxNXU0ZTBuFwEVcufYXR2u3IBY8Lbom4fhuD96
 hCJx14FwMifaRG1PwgL2OKI8rhNMUwv0o1Rh2BVfYcMQfR8juj/ePv009mr4Pij3ov1F32Jn860i
 +U=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:reIwZsVKEmY=:OdcvPt3y6Gtjtf7voK7vlr
 eRFrFElFaMPbG+iXQpUCFFPdPZrWB1ZLMcOELgZaolJAC/NiCdLGLCSpNUexBhYuwTrKhlovO
 1QExfqjLBVD5p9d5O93qHKEHDf/HALklDGW/VQQFFTJGM8e0nCe7+F9pDd5NNaKWqrRlN44rc
 ngugcyWvq8Jw0oORoVZSvyyR+CMjEPkrSv/UVRviY5tkxUy9irw7+e5XygGcmBzFEiSbRpKhC
 Gpd8Sx6DJ5CkbORlE3R3Ik2xyUpjl2X4NhZj0I1Y4BbruuifCEo3ZLJfhNn3sjZlSdhyfrREm
 LQKyeDj5g3ofqGLDbKXhuJHxvrsQ0N4DB4qc6UzMZuAd+nbKxXvzX0HcrNadJtzwgZj/R6ywd
 7WbFyHa1A1ifz+Q9P2rKUEJDLuHgPMlPu96lSjlKFwBKZSBJnZiWS9QfKnZHDMwiv+NVOxrJ9
 3TJbLLpATsKYOcRv/zZ94CYBv/g5GIqGZahqDKjUb117lzhDOvrdqVpxq0fAFMR2aUqq2vH2Y
 EACudOQGmHjI+FslHxBGF6ycl8P0jyF0lFBWw/TNsA4D423pzg6pm1Sa9fEIX5vuCGAhB5nHZ
 ZXcnIcIKcnnbXkyEZyZxSLlY2F52i69g6FnggXXvUt5O1YwR9RyYD8SDpm4sFU9dCh3bLhGNB
 2g6aQw9tids5Ggw3uG4pSY6mwsaEZUBpWSQiLVbZRFBouew==
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel Machek wrote:

> Find out what is wrong with the patch, fix it, resubmit it.

I would like to, but unfortunately, I've no skills in programming so I'm not able to do that.

> Oh. It appears to register trigger per block device. That's no-no.

Hmm, why is that a no-no? It seems it works that way for CPUs already. I can see triggers from cpu0 to cpu39 on our servers with two CPUs, 10 cores and 2 threads per core. So we even have one trigger for every cpu thread.

I've never seen a host with 40 nvme disks, so why is this problematic if having 40 cpu triggers is not? Or does "trigger per block device" mean sth. else?

Michael


